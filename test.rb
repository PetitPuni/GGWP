# options = [
#   { action: 'shots', gun: 'nova' },
#   { action: 'hits', gun: 'mp7' }
# ]

# stats = FetchSteamUserStats.call(steam_id: '76561197981067382', game_id: '730', options: options)

# ap  'retour de fetch_steam_user_stats'
# ap stats

# ap '1 = 54 et 2 = 16'

ap UserLeagueChallenge.find(321).update(init_user_stat: 25, end_value: 25, progress: 0, succes: false)
ap UserLeagueChallenge.find(318).update(init_user_stat: -20, end_value: -20, progress: 0, succes: false)


# ap UserLeague.find(59).user_league_challenges


# UpdateLeagueChallenges.call(league: League.last)



# # options = [
# #   { action: 'shot', gun: 'nova' },
# #   { action: 'hit', gun: 'mp7' }
# # ]

# # stats = FetchSteamUserStats.call(steam_id: '76561197981067382', game_id: '730', options: options)

# # ap stats


# ap UserLeague.find(59).user_league_challenges
