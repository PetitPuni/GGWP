class LeaguesController < ApplicationController
  before_action :set_league, only: %i[show edit update destroy join]

  def index
    @leagues = current_user.leagues
  end

  def show
    @url = "#{join_league_url}?token=#{@league.token}"
  end

  def new
    @league = League.new
    @games = Game.all
  end

  def create
    @league = League.new(league_params)
    @league.token = RandomToken.gen(6)
    if @league.save!
      UserLeague.new(user: current_user, league: @league)
      redirect_to league_path(@league)
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
    @user_league = UserLeague.new
    if @league.token == params[:token]
      @user_league.league = @league
      @user_league.user = current_user
      @user_league.save
      redirect_to leagues_path(@league)
    else
      flash.alert = "Worng token."
      redirect_to leagues_path
    end
  end

  private

  def league_params
    params.require(:league).permit(:name, :description, :start_on, :end_on, :game_id, :token)
  end

  def set_league
    @league = League.find(params[:id])
  end
end
