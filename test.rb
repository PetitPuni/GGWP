# options = [
#   { action: 'shots', gun: 'nova' },
#   { action: 'hits', gun: 'mp7' }
# ]

# stats = FetchSteamUserStats.call(steam_id: '76561197981067382', game_id: '730', options: options)

# ap  'retour de fetch_steam_user_stats'
# ap stats

# ap '1 = 54 et 2 = 16'

def reset
  league = League.find(113)
  league.update(start_on: 10_000.seconds.from_now, end_on: 1000.minute.from_now)
  UserLeagueChallenge.destroy_all
end

def reset_challenges
  chal1 = UserLeagueChallenge.find(1247)
  chal2 = UserLeagueChallenge.find(1248)
  chal1.update(succes: false, progress: 0, init_user_stat: 0, end_value: 0)
  chal2.update(succes: false, progress: 0, init_user_stat: 0, end_value: 0)
end

def start
  league = League.find(113)
  league.update!(start_on: Time.now, end_on: 1.minute.from_now)
  StartLeagueChallenges.call(league: League.find(113))
end

def update_challenges
  UpdateLeagueChallenges.call(league: League.find(113))
end

def update_site
  @user = User.find_by(steam_username: "petitpuni")
  leagues = []
  League.all.each { |league| leagues << league }
  leagues.each do |league|
    @scroe = 0
    user_league = UserLeague.new
    user_league.league = league
    user_league.user = @user
    user_league.save
    league.challenges.each do |challenge|
      @score += challenge.points
      UserLeagueChallenge.create(user_league: @user_league, challenge:, init_user_stat: 0, end_value: 0,
                                 progress: 100, succes: true)
    end
    user_league.update(score: @score)
  end
end

# ap UserLeagueChallenge.find(1119).update(init_user_stat: -50, end_value: -50, progress: 0, succes: false)
# ap UserLeagueChallenge.find(1054).update(init_user_stat: -50, end_value: -50, progress: 0, succes: false)

# ap UserLeague.find(59).user_league_challenges

# UpdateLeagueChallenges.call(league: League.last)

# # options = [
# #   { action: 'shot', gun: 'nova' },
# #   { action: 'hit', gun: 'mp7' }
# # ]

# # stats = FetchSteamUserStats.call(steam_id: '76561197981067382', game_id: '730', options: options)

# # ap stats

# ap UserLeague.find(59).user_league_challenges
