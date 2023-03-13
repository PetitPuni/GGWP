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
    @player_rankings = UpdateLeagueChallenges.new(league: @league).show_ranking
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
    @options = @challenges.sort.map do |challenge|
      { action: challenge.action, gun: challenge.gun }
    end
    @league.user_leagues.each do |user_league|
      values = FetchSteamUserStats.call(steam_id: user_league.user.steam_id, game_id: @league.game.app_id, options: @options)
      @challenges.each_with_index do |challenge, index|
        UserLeagueChallenge.create!(user_league:,
                                    challenge:, init_user_stat: values[index],
                                    end_value: values[index], progress: 0)
      end
    end
    redirect_to league_path(@league)
  end

  def update_stats
    UpdateLeagueChallenges.call(league: League.last)
  end

  private

  def league_params
    params.require(:league).permit(:name, :description, :start_on, :end_on, :game_id, :token)
  end

  def set_league
    @league = League.find(params[:id])
  end
end
