# Path: app/services/steam_service.rb

require 'httparty'

class SteamService < ApplicationService
  def initialize(steam_id:, game_id:)
    @steam_id = steam_id
    @game_id = game_id
  end

  def call
    get_user_stats(@steam_id, @game_id)
  end

  private

  def get_user_stats(steam_id, game_id)
    api_key = ENV.fetch('STEAM_API_KEY', nil)
    stats = []
    url = "https://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v2/?appid=#{game_id}&key=#{api_key}&steamid=#{steam_id}"
    response = HTTParty.get(url)
    stats << response.parsed_response['playerstats']
    stats.flatten
  end
end
