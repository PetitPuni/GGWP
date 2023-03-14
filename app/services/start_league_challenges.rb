class StartLeagueChallenges < ApplicationService

  def initialize(league:)
    @league = league
  end

  def call
    start
    broadcast
    user_challenges
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

  def user_challenges
    @challenges = UserLeagueChallenge.joins(user_league: [:league]).includes(:challenge)
                                     .where(user_leagues: { user_id: @current_user, league_id: @league})
                                     .order('progress DESC')
  end

  def broadcast
    partial = "leagues/league_challenges"
    ap 'je suis dans broadcast de start league challenges'
    @broadcast_challenges = ActionController::Base.new.render_to_string(partial:, locals: {challenges: @challenges, league: @league})
    LeagueChannel.broadcast_to(
      @league, { key: "leagueChallenges", data: {challenges: @broadcast_challenges}}
    )
  end
end
