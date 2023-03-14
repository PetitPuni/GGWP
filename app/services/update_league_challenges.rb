class UpdateLeagueChallenges < ApplicationService

  def initialize(league:)
    @league = league
  end

  def call
    define_options # we need options variable for each call api. This variable is the same for each call
    update_user_league_challenges
    broadcast
  end

  def show_ranking
    ranking
  end

  private

  def update_user_league_challenges
    @league.user_leagues.each {|user_league| update_user_league(user_league)}
  end

  def broadcast
    ranking
    @rank = ActionController::Base.new.render_to_string(partial: "leagues/ranking_player", locals: {player_rankings: ranking, league: @league})
    LeagueChannel.broadcast_to(
      @league, { key: "ranking", data: {rank: @rank}}
    )
  end

  def define_options
    @options = @league.challenges.order(:id).map do |challenge|
      { action: challenge.action, gun: challenge.gun }
    end
  end

  def update_user_league(user_league)
    @user_league = user_league
    fetch_values
    update_challenges
  end

  def fetch_values
    @values = FetchSteamUserStats.call(steam_id: @user_league.user.steam_id, game_id: @league.game.app_id, options: @options)
  end

  def update_challenges
    @user_league.user_league_challenges.order(:challenge_id).each_with_index do |user_league_challenge, index|
      if user_league_challenge.init_user_stat.nil?
        init_user_stat = @values[index]
        user_league_challenge.update(end_value: @values[index], init_user_stat: @values[index])
      else
        user_league_challenge.update(end_value: @values[index])
      end
    end
  end

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
