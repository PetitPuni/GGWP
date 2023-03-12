class LeaguesController < ApplicationController
  before_action :set_league, only: %i[show edit update destroy start join update_stats]
  skip_before_action :authenticate_user!, only: %i[join]

  def index
    @leagues = current_user.leagues
  end

  def show
    @challenges = UserLeagueChallenge.joins(user_league: [:league]).includes(:challenge)
                                     .where(user_leagues: { user_id: current_user, league_id: @league})
                                     .order('progress DESC')
    @url = "#{join_league_url}?token=#{@league.token}"
    @users = @league.users
    @league = League.find(params[:id])
    @player_rankings = ranking
  end

  def new
    @league = League.new
    @games = Game.all
  end

  def create
    @league = League.new(league_params)
    @league.token = RandomToken.gen(6)
    if @league.save!
      userleague = UserLeague.new(user: current_user, league: @league)
      redirect_to league_path(@league) if userleague.save!
    else
      render :new, status: :unrpocessable_entity
    end
  end

  def edit
  end

  def update
    @league.update(league_params)
  end

  def destroy
    @league.destroy
    redirect_to leagues_path
  end

  def join
    ap "je suis dans le join"
    session[:url] = request.url
    return redirect_to steam_connect_path unless current_user
    if League.where('token like ?', params[:token]).exists?
      @user_league = UserLeague.new
      @user_league.league = @league
      @user_league.user = current_user
      if @user_league.save
        unless @league.challenges.blank?
          @league.challenges.each do |challenge|
            UserLeagueChallenge.create(user_league: @user_league, challenge: challenge,
                                       init_user_stat: nil)
          end
          update_stats
        end
        UserLeagueChannel.broadcast_to(
          @league,
          render_to_string(partial: "users/user", locals: {user: current_user})
        )
      else
        flash.alert = "You are already in this league."
      end
      redirect_to league_path(@league)
    else
      flash.alert = "Worng token."
      redirect_to leagues_path
    end
    session[:url] = nil
  end

  def start
    @challenges = @league.game.challenges.shuffle.take(5)
    @options = {}
    @challenges.each do |challenge|
      @options[challenge.id.to_s] = { action: challenge.action, gun: challenge.gun, ennemies: challenge.ennemies }
    end
    @league.user_leagues.each do |user_league|
      values = FetchSteamUserStats.call(steam_id: user_league.user.steam_id, game_id: @league.game.app_id, options: @options)
      @challenges.each do |challenge|
        UserLeagueChallenge.create!(user_league:,
                                    challenge:, init_user_stat: values[challenge.id.to_s],
                                    end_value: values[challenge.id.to_s], progress: 0)
      end
    end
    redirect_to league_path(@league)
  end

  def update_stats
    @options = {}
    @league.challenges.each do |challenge|
      @options[challenge.id.to_s] = { action: challenge.action, gun: challenge.gun, ennemies: challenge.ennemies }
    end
    ap @options
    @league.user_leagues.each do |user_league|
      values = FetchSteamUserStats.call(steam_id: user_league.user.steam_id, game_id: @league.game.app_id, options: @options)
      user_league.user_league_challenges.each do |user_league_challenge|
        user_league_challenge.update!(init_user_stat: values[user_league_challenge.challenge_id.to_s]) if user_league_challenge.init_user_stat.nil?
        unless user_league_challenge.succes
          progress = (((values[user_league_challenge.challenge_id.to_s] - user_league_challenge.init_user_stat) / @options[user_league_challenge.challenge_id.to_s][:ennemies].to_f ) * 100).round
          progress >= 100 ? succes = true : succes = false
          if user_league_challenge.update!(end_value: values[user_league_challenge.challenge_id.to_s], progress:, succes: )
            @player_rankings = ranking
            RankingChannel.broadcast_to(
              @league,
              render_to_string(partial: "ranking", locals: {player_rankings: @player_rankings})
            )
          end
        end
      end
    end
  end

  private

  def league_params
    params.require(:league).permit(:name, :description, :start_on, :end_on, :game_id, :token)
  end

  def set_league
    @league = League.find(params[:id])
  end

  def ranking
    User.joins(user_leagues: { user_league_challenges: :challenge })
                            .where(user_leagues: { league_id: @league.id, user_league_challenges: { succes: true } })
                            .select("users.steam_username, COALESCE(COUNT(DISTINCT challenges.id), 0) AS challenges, COALESCE(SUM(challenges.points), 0) AS score")
                            .group("users.id")
                            .order("score DESC")
  end
end
