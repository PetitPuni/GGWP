# Path: app/controllers/user_leagues_controller.rb

class UserLeaguesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_leagues = UserLeague.all
    @leagues = League.all
    @stats = SteamService.call('76561197981067382', @league.game.app_id) || []
    @stats = SteamService.call('76561197981067382', @league.game.app_id) || []
  end

  def show
    @user_league = UserLeague.find(params[:id])
  end

  def my_stats
    @steam_id = params[:steam_id]
    @stats = SteamService.call(steam_id: @steam_id, game_id: 730)
  end

  def my_challenges
    @challenges = UserLeagueChallenge.where(user_league_id: current_user.id)
  end
end
