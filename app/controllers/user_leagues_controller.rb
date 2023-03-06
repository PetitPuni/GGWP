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

  private

  def user_league_params
    params.require(:user_league).permit(:user_id, :league_id)
  end
end
# Path: app/controllers/leagues_controller.rb
