# Path: app/controllers/user_leagues_controller.rb

class UserLeaguesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_leagues = UserLeague.all
    @leagues = League.all
    @stats = SteamService.get_user_stats('76561197981067382')
    @stats = SteamService.get_user_stats('76561197981067382') || []
  end

  def show
    @user_league = UserLeague.find(params[:id])
  end

  def my_stats
    @steam_id = params[:steam_id]
    @stats = SteamService.get_user_stats(steam_id)
  end

  def my_challenges
    @challenges = UserLeagueChallenge.where(user_league_id: current_user.id)
  end
end
