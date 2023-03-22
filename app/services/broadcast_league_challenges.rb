class BroadcastLeagueChallenges < ApplicationService
  def initialize(league:)
    @league = league
  end

  def call
    broadcast
  end

  private

  def broadcast
    player_rankings = RankingLeagueService.call(league: @league)

    ranking_html = ActionController::Base.new.render_to_string(partial: 'leagues/ranking_player',
                                                               locals: {
                                                                 league: @league, player_rankings:
                                                               })
    challenge_html = ActionController::Base.new.render_to_string(partial: "leagues/league_challenges",
                                                                 locals: {
                                                                   challenges: @challenges, league: @league
                                                                 })

    user_challenges = @league.user_leagues.to_h do |user_league|
      html = ActionController::Base.new.render_to_string(partial: "leagues/user_challenges",
                                                         locals: { user_challenges: user_league.user_league_challenges.order('progress DESC') })
      [user_league.user_id, html]
    end

    data = {
      ranking: ranking_html,
      challenges: challenge_html,
      user_challenges:
    }

    LeagueChannel.broadcast_to(
      @league, { key: "start", data: }
    )
  end
end
