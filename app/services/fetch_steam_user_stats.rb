class FetchSteamUserStats < ApplicationService
  attr_reader :steam_id, :game_id, :options
  def initialize(steam_id:, game_id:, options:)
    @steam_id = steam_id
    @game_id = game_id
    @options = options
  end

  def call
    make_request
    @stats
  end


  private

  def make_request
    ap "je dois faire make request"
    @data = SteamService.call(steam_id: @steam_id, game_id: @game_id)
    extract_stats
  end


  def extract_stats
    ap "je suis dans extract_stats"
    ap 'jai acces a @data'
    ap @data

    ap "et avec les otpions je cherches les valuers"
    ap @options
    @stats = @options.map do |option|
      ap "je cherche la valeur de #{option[:action]} #{option[:gun]}"
      @data[0]["stats"].find { |stat| stat['name'].include?("#{option[:action]}s_#{option[:gun]}") }['value']
    end
    @stats
  end

end
