class RankingLeagueService < ApplicationService

  def initialize(league:)
    @league = league
  end

  def call
    ranking
  end

  private

  def ranking
    # User.joins(user_leagues: { user_league_challenges: :challenge })
    #                         .where(user_leagues: { league_id: @league.id, user_league_challenges: { succes: true } })
    #                         .select("users.steam_username, COALESCE(COUNT(DISTINCT challenges.id), 0) AS challenges, COALESCE(SUM(challenges.points), 0) AS score")
    #                         .group("users.id")
    #                         .order("score DESC")
    User.joins(user_leagues: [:league])
        .where(user_leagues: { league_id: @league.id })
        .select("users.steam_username, user_leagues.score")
        .order("score DESC")
  end

end
