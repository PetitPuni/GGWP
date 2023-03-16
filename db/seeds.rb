# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'destroying all by replanting'

# puts 'creating user, league, challenge, user_league, user_league_challenge'

# user1 = User.create!(
  #   steam_id: '76561197981067382'
  # )
  guns = ['ak47', 'aug', 'awp', 'axe', 'bizon', 'c4', 'cz75a', 'deagle', 'decoy', 'elite', 'famas', 'fists', 'fiveseven', 'flashbang', 'g3sg1', 'galilar', 'glock', 'hammer', 'hkp2000', 'incgrenade', 'knifegg', 'm249', 'm4a1', 'm4a1_silencer', 'mac10', 'mag7', 'molotov', 'mp5sd', 'mp7', 'mp9', 'negev', 'nova', 'p250', 'p90', 'revolver', 'breachcharge', 'bumpmine', 'sawedoff', 'scar20', 'sg556', 'smokegrenade', 'snowball', 'spanner', 'ssg08', 'tagrenade', 'taser', 'tec9', 'ump45', 'usp_silencer', 'xm1014', 'zone_repulsor']

  actions = ['hit', 'shot', 'kill']
  # actions1 = ['hits', 'shots', 'kills', 'deaths']

  actions_coef = [hit = 1, shot = 2, kill = 3]
  points1 = (1..50).to_a.sample

# ap User.all
game = Game.create!(
  name: "csgo",
  genre: "FPS",
  description: "Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago. CS: GO features new maps, characters, and weapons and delivers updated versions of the classic CS content (de_dust, etc.). In addition, CS: GO will introduce new gameplay modes, matchmaking, leader boards, and more.",
  app_id: 730
 )

challenges3 =
actions.each do |action|
  guns.each do |gun|
    ennemies = (1..50).to_a.sample
    multiplier = case action
    when 'hit'
      1
    when 'shot'
      2
    when 'kill'
      3
    end

    ennemies = (1..25).to_a.sample
    points = ennemies * multiplier * 5

    challenge = Challenge.create!(
      name: "#{ApplicationController.helpers.action_capitalize(action)} #{ennemies} with #{ApplicationController.helpers.translate_weapon(gun)}",
      description: "Your mission, if you choose to accept it, is to #{ApplicationController.helpers.action_capitalize(action)} #{ennemies} ennemies with #{ApplicationController.helpers.translate_weapon(gun)} !",
      points: points,
      game: game,
      ennemies: ennemies,
      gun: gun,
      action: action
    )
    ap challenge.name
  end
end

userCSgo = []
userCSgo << user1CSgo = User.create!(steam_username: 'ZywOo', steam_image: '/assets/bot_avatar.png', steam_id: '00001')
userCSgo << user2CSgo = User.create!(steam_username: 'dev1ce', steam_image: '/assets/bot_avatar.png', steam_id: '00002')
userCSgo << user3CSgo = User.create!(steam_username: 's1mple', steam_image: '/assets/bot_avatar.png', steam_id: '00003')
userCSgo << user4CSgo = User.create!(steam_username: 'electronic', steam_image: '/assets/bot_avatar.png', steam_id: '00004')
userCSgo << user5CSgo = User.create!(steam_username: 'kennyS', steam_image: '/assets/bot_avatar.png', steam_id: '00005')
# ap 'user created'



 game2 = Game.create!(
   name: "dota-2",
   genre: "MOBA",
   description: "Dota 2 is a multiplayer online battle arena (MOBA) video game in which two teams of five players compete to collectively destroy a large structure defended by the opposing team known as the Ancient, whilst defending their own.",
   app_id: 570
 )

 game3 = Game.create!(
   name: "TF2",
   genre: "MOBA",
   description: "League of Legends is a multiplayer online battle arena video game developed and published by Riot Games for Microsoft Windows and macOS. Inspired by the Warcraft III: The Frozen Throne mod Defense of the Ancients, the game follows a freemium model and is supported by microtransactions, and was inspired by the Warcraft III: The Frozen Throne mod, Defense of the Ancients.",
   app_id: 21779
 )

 game4 = Game.create!(
   name: "apex",
   genre: "FPS",
   description: "Apex Legends is a free-to-play battle royale game developed by Respawn Entertainment and published by Electronic Arts. It was released for Microsoft Windows, PlayStation 4, and Xbox One on February 4, 2019, without any prior announcement or marketing.",
   app_id: 1172470
 )


userDota2 = []
userDota2 << user1Dota2 = User.create!(steam_username: 'Sumail', steam_image: '/assets/bot_avatar.png', steam_id: '0000012')
userDota2 << user2Dota2 = User.create!(steam_username: 'Arteezy', steam_image: '/assets/bot_avatar.png', steam_id: '0000013')
userDota2 << user3Dota2 = User.create!(steam_username: 'UNiVeRsE', steam_image: '/assets/bot_avatar.png', steam_id: '0000014')


userTF2 = []
userTF2 << user1TF2 = User.create!(steam_username: 'Sassy', steam_image: '/assets/bot_avatar.png', steam_id: '0000015')
userTF2 << user2TF2 = User.create!(steam_username: 'Saussage', steam_image: '/assets/bot_avatar.png', steam_id: '0000016')
userTF2 << user3TF2 = User.create!(steam_username: 'Toto', steam_image: '/assets/bot_avatar.png', steam_id: '0000017')
userTF2 << user4TF2 = User.create!(steam_username: 'Nico', steam_image: '/assets/bot_avatar.png', steam_id: '0000018')


userApex = []
userApex << user1Apex = User.create!(steam_username: 'Sassy', steam_image: '/assets/bot_avatar.png', steam_id: '0000019')
userApex << user2Apex = User.create!(steam_username: 'Saussage', steam_image: '/assets/bot_avatar.png', steam_id: '0000010')
userApex << user3Apex = User.create!(steam_username: 'Toto', steam_image: '/assets/bot_avatar.png', steam_id: '000002')
userApex << user4Apex = User.create!(steam_username: 'Titi', steam_image: '/assets/bot_avatar.png', steam_id: '0000021')
userApex << user5Apex = User.create!(steam_username: 'Tata', steam_image: '/assets/bot_avatar.png', steam_id: '0000022')


l1 = League.create!(name: 'CSGO', description: 'CSGO', game: game, start_on: Date.today - 2.days, end_on: Date.today - 1.days, token: RandomToken.gen(6))
l2 = League.create!(name: 'Dota2', description: 'Dota2', game: game2, start_on: Date.today, end_on: Date.today + 10.days, token: RandomToken.gen(6))
l3 = League.create!(name: 'TeamFortress2', description: 'TF2', game: game3, start_on: Date.today, end_on: Date.tomorrow, token: RandomToken.gen(6))
l4 = League.create!(name: 'Apex', description: 'Apex', game: game4, start_on: Date.today - 2.days, end_on: Date.tomorrow, token: RandomToken.gen(6))

userCSgo.each do |user|
  UserLeague.create!(user_id: user.id, league_id: l1.id, score: [10, 20, 30, 50, 60].sample)
end


userDota2.each do |user|
  UserLeague.create!(user_id: user.id, league_id: l2.id, score: [10, 20, 30, 50, 60].sample)
end

userTF2.each do |user|
  UserLeague.create!(user_id: user.id, league_id: l3.id, score: [10, 20, 40, 50, 70].sample)
end

userApex.each do |user|
  UserLeague.create!(user_id: user.id, league_id: l4.id, score: [10, 20, 30, 50, 60].sample)
end

cDota = []
cDota << c1Dota2 = Challenge.create!(name: 'Again job', description: 'Have got 20 peons', points: 10, game: game2)
cDota << c2Dota2 = Challenge.create!(name: 'Be a hero', description: "Kill the enemie's hero", points: 20, game: game2)
cDota << c3Dota2 = Challenge.create!(name: 'Winner', description: 'Win 5 games', points: 30, game: game2)
cDota << c4Dota2 = Challenge.create!(name: 'God damage', description: 'Do 1000 damages with your hero', points: 60, game: game2)
cDota << c5Dota2 = Challenge.create!(name: 'Conqueror', description: 'Conquer 5 bases', points: 50, game: game2)

cTF2 = []
cTF2 << c1TF2 = Challenge.create!(name: 'Damage', description: 'Make 250 damage with rifle', points: 10, game: game3)
cTF2 << c2TF2 = Challenge.create!(name: 'Dexter', description: 'Kill 5 guys with a knife', points: 20, game: game3)
cTF2 << c3TF2 = Challenge.create!(name: 'Immortal', description: 'Finish a game with 0 deaths', points: 70, game: game3)
cTF2 << c4TF2 = Challenge.create!(name: 'Controle', description: 'Control a zone during 5 min', points: 40, game: game3)
cTF2 << c5TF2 = Challenge.create!(name: 'Kill master', description: 'Make 20 kills in one game', points: 50, game: game3)

cApex = []
cApex << c1Apex = Challenge.create!(name: 'Knockdowns', description: 'Get 5 knockdowns', points: 10, game: game4)
cApex << c2Apex = Challenge.create!(name: 'Make kills', description: 'Get 10 kills in a single match', points: 20, game: game4)
cApex << c3Apex = Challenge.create!(name: 'True damage', description: 'Deal 250 damage as "legend" in any mode', points: 30, game: game4)
cApex << c4Apex = Challenge.create!(name: 'Collect bins', description: 'Open 10 supply bins', points: 40, game: game4)
cApex << c5Apex = Challenge.create!(name: 'Easy damage', description: 'Deal 100 damage with assault rifles', points: 60, game: game4)


League.all.each do |league|
  league.challenges.shuffle.take(5).each do |challenge|
    league.user_leagues.each do |user_league|
      UserLeagueChallenge.create(user_league: user_league, challenge: challenge,
        init_user_stat: 0, end_value: 0)
    end
  end
end



# ap 'game created'

# league = League.create!(
#   name: "League 1",
#   description: "the first league of the batch #1102",
#   start_on: Date.today,
#   end_on: Date.today + 1.month,
#   game: game,
#   token: RandomToken.gen(6)
# )

# ap 'league created'

# challenge = Challenge.create!(
#   name: "Kill 10 enemies",
#   description: "Kill 10 enemies with a pistol",
#   points: 10,
#   key: 1,
#   game: game
# )

# challenge1 = Challenge.create!(
#   name: "defuse the bomb",
#   description: "defuse the bomb",
#   points: 10,
#   key: 2,
#   game: game
# )

# challenge2 = Challenge.create!(
#   name: "plant the bomb",
#   description: "plant the bomb",
#   points: 10,
#   key: 3,
#   game: game
# )

# ap 'challenge created'

# user_league = UserLeague.create!(
#   user: user1,
#   league: league
# )

# ap 'user_league created'

# UserLeagueChallenge.create!(
#   challenge: challenge,
#   user_league: user_league
# )

# UserLeagueChallenge.create!(
#   challenge: challenge1,
#   user_league: user_league
# )

# UserLeagueChallenge.create!(
#   challenge: challenge2,
#   user_league: user_league
# )


# ap 'user_league_challenge created'


#  VARIABLE USED FOR THE CHALLENGE GENERATOR




# CHALLENGES GENERATOR


ap 'CHALLENGES GENERATOR CREATED'



puts 'done'



# challenges3 = Challenge.create!(name: "You need to #{action1} with this #{translate_weapon(gun)} ! " )
# challenges2 = "You need to kill #{kill} before the end of the league ! "
