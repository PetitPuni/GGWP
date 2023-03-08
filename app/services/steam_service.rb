# Path: app/services/steam_service.rb

require 'httparty'

class SteamService < ApplicationService
  def self.get_user_stats(steam_id)
    api_key = ENV['STEAM_API_KEY']
    app_ids = [730, 440]
    stats = []
    app_ids.each do |app_id|
      url = "https://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v2/?appid=#{app_id}&key=#{api_key}&steamid=#{steam_id}"
      response = HTTParty.get(url)
      stats << response.parsed_response['playerstats']
    end
    stats.flatten
  end
end
