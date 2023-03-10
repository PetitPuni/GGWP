options = [
  { action: 'shots', gun: 'nova' },
  { action: 'hits', gun: 'mp7' }
]

stats = FetchSteamUserStats.call(steam_id: '76561197981067382', game_id: '730', options: options)

ap  'retour de fetch_steam_user_stats'
ap stats

ap '1 = 54 et 2 = 16'
