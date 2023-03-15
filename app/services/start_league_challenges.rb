class StartLeagueChallenges < ApplicationService

  def initialize(league:)
    @league = league
  end

  def call
    start
    broadcast
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


  def broadcast
    player_rankings = RankingLeagueService.call(league: @league)

    ranking_html = ActionController::Base.new.render_to_string(partial: 'leagues/ranking_player', locals: {league: @league, player_rankings: player_rankings})
    challenge_html = ActionController::Base.new.render_to_string(partial: "leagues/league_challenges", locals: {challenges: @challenges, league: @league})


    user_challenges = @league.user_leagues.to_h do |user_league|
      html = ActionController::Base.new.render_to_string(partial: "leagues/user_challenges", locals: {user_challenges: user_league.user_league_challenges.order('progress DESC')})
      [user_league.user_id, html]
    end

    data = {
      ranking: ranking_html,
      challenges: challenge_html,
      user_challenges: user_challenges
    }

    LeagueChannel.broadcast_to(
      @league, { key: "start", data:}
    )
  end
end
