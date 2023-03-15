class UpdateLeagueChallenges < ApplicationService

  def initialize(league:)
    @league = league
  end

  def call
    define_options # we need options variable for each call api. This variable is the same for each call
    update_user_league_challenges
    broadcast
  end

  private

  def define_options
    @options = @league.challenges.order(:id).map do |challenge|
      { action: challenge.action, gun: challenge.gun }
    end
  end

  def update_user_league_challenges
    @league.user_leagues.each {|user_league| update_user_league(user_league)}
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

  def broadcast
    player_rankings = RankingLeagueService.call(league: @league)
    ranking_html = ActionController::Base.new.render_to_string(partial: 'leagues/ranking_player', locals: {league: @league, player_rankings: player_rankings})

    user_challenges = @league.user_leagues.to_h do |user_league|
      html = ActionController::Base.new.render_to_string(partial: "leagues/user_challenges", locals: {user_challenges: user_league.user_league_challenges.order('progress DESC')})
      [user_league.user_id, html]
    end

    data = {
      ranking: ranking_html,
      user_challenges: user_challenges
    }

    LeagueChannel.broadcast_to(
      @league, { key: "update", data:}
    )
  end
end
