class LeaguesController < ApplicationController
  before_action :set_league, only: %i[show edit update destroy start join]
  skip_before_action :authenticate_user!, only: %i[join]

  def index
    @leagues = current_user.leagues
  end

  def show
    @challenges = @league.challenges
    @url = "#{join_league_url}?token=#{@league.token}"
    @users = @league.users
    @league = League.find(params[:id])
    @player_rankings = User.joins(user_leagues: { user_league_challenges: :challenge })
                            .where(user_leagues: { league_id: @league.id, user_league_challenges: { succes: true } })
                            .select("users.steam_username, COALESCE(COUNT(DISTINCT challenges.id), 0) AS challenges, COALESCE(SUM(challenges.points), 0) AS score")
                            .group("users.id")
                            .order("score DESC")
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
      @user_league.save
      redirect_to league_path(@league)
    else
      flash.alert = "Worng token."
      redirect_to leagues_path
    end
    session[:url] = nil
  end

  def start
      @challenges = @league.game.challenges.shuffle().first(5)
      @challenges.each do |challenge|
        @league.user_leagues.each do |user_league|
            UserLeagueChallenge.create!(user_league: user_league, challenge: challenge)
        end
      end
      redirect_to league_path(@league)
  end

  def start
      @challenges = @league.game.challenges.shuffle().first(5)
      @challenges.each do |challenge|
        @league.user_leagues.each do |user_league|
            UserLeagueChallenge.create!(user_league: user_league, challenge: challenge)
        end
      end
      redirect_to league_path(@league)
  end

  private

  def league_params
    params.require(:league).permit(:name, :description, :start_on, :end_on, :game_id, :token)
  end


  def set_league
    @league = League.find(params[:id])
  end
end
