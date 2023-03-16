class PrestartLeagueChallenges < ApplicationService
  DELAY_START = ENV.fetch('DELAY_START', '1').to_i

  def initialize(league:)
    @league = league
  end

  def call
    pick_random_challenges
    create_user_league_challenges
    save_job_to_start_league
  end

  private

  def pick_random_challenges
    @challenges = @league.game.challenges.shuffle.take(5)
  end


  def create_user_league_challenges
    @league.user_leagues.each do |user_league|
      user_stats = gets_user_stats(user_league)
      @challenges.each_with_index do |challenge, index|
        UserLeagueChallenge.create!(user_league:,
                                    challenge:, init_user_stat: user_stats[index],
                                    end_value: user_stats[index], progress: 0)
      end
    end
  end

  def gets_user_stats(user_league)
    FetchSteamUserStats.call(steam_id: user_league.user.steam_id, game_id: @league.game.app_id, options: options_steam_user_stats)
  end

  def options_steam_user_stats
    @options_steam_user_stats ||= @challenges.sort.map do |challenge|
      { action: challenge.action, gun: challenge.gun }
    end
  end

  def save_job_to_start_league
    prestart_on = @league.start_on - 1.hour - DELAY_START.seconds
    StartLeagueJob.set(wait_until: prestart_on).perform_later(@league)
  end
end
