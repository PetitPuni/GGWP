class UserLeaguesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_leagues = UserLeague.all
  end

  def show
    @user_league = UserLeague.find(params[:id])
  end
end
# Path: app/controllers/leagues_controller.rb
