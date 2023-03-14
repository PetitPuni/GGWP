# frozen_string_literal: true
require "uri"
require "net/http"

class FetchSteamAttributesFromSteamId < ApplicationService

  API_KEY = ENV.fetch("STEAM_API_KEY")

  def initialize(steam_id)
    @steam_id = steam_id
  end

  def call
    ap url
    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Get.new(url)

    response = http.request(request)
    data = JSON.parse(response.read_body)
    player = data["response"]["players"].first

    {
      username: player["personaname"],
      image: player["avatarfull"]
    }
  end

  private

  def url
    URI("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{API_KEY}&steamids=#{@steam_id}")
  end
end
