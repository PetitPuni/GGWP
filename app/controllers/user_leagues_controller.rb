class UserLeaguesController < ApplicationController
  before_action :authenticate_user!
  validates :user_id, :league_id, presence: true
  validates :user_id, uniqueness: { scope: :league_id }
  belongs_to :user
  belongs_to :league

  def index
    @user_leagues = UserLeague.all
  end

  def show
    @user_league = UserLeague.find(params[:id])
  end

  def new
    @user_league = UserLeague.new
  end

  def create
    @user_league = UserLeague.new(user_league_params)
    if @user_league.save
      redirect_to user_league_path(@user_league)
    else
      render :new
    end
  end

  def edit
    @user_league = UserLeague.find(params[:id])
  end

  def update
    @user_league = UserLeague.find(params[:id])
    @user_league.update(user_league_params)
    redirect_to user_league_path(@user_league)
  end

  def destroy
    @user_league = UserLeague.find(params[:id])
    @user_league.destroy
    redirect_to user_leagues_path
  end

  private

  def user_league_params
    params.require(:user_league).permit(:user_id, :league_id)
  end
end
