class StartLeagueChallenges < ApplicationService

  def initialize(league:)
    @league = league
  end

  def call
    start
  end

  private

  def start
    @challenges = @league.game.challenges.shuffle.take(5)
    @options = @challenges.sort.map do |challenge|
      { action: challenge.action, gun: challenge.gun }
    end
    @league.user_leagues.each do |user_league|
      values = FetchSteamUserStats.call(steam_id: user_league.user.steam_id, game_id: @league.game.app_id, options: @options)
      @challenges.each_with_index do |challenge, index|
        UserLeagueChallenge.create!(user_league:,
                                    challenge:, init_user_stat: values[index],
                                    end_value: values[index], progress: 0)
      end
    end
  end
end
