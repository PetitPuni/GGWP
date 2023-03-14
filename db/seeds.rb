# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'destroying all by replanting'

ap User.all

# puts 'creating user, league, challenge, user_league, user_league_challenge'

# user1 = User.create!(
#   steam_id: '76561197981067382'
# )

# ap User.all

# ap 'user created'

game = Game.create!(
   name: "csgo",
   genre: "FPS",
   description: "Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago. CS: GO features new maps, characters, and weapons and delivers updated versions of the classic CS content (de_dust, etc.). In addition, CS: GO will introduce new gameplay modes, matchmaking, leader boards, and more.",
   app_id: 730
  )

  game2 = Game.create!(
    name: "dota-2",
    genre: "MOBA",
    description: "Dota 2 is a multiplayer online battle arena (MOBA) video game in which two teams of five players compete to collectively destroy a large structure defended by the opposing team known as the Ancient, whilst defending their own.",
    app_id: 570
  )

  game3 = Game.create!(
    name: "lol",
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

guns = ['ak47', 'aug', 'awp', 'axe', 'bizon', 'c4', 'cz75a', 'deagle', 'decoy', 'elite', 'famas', 'fists', 'fiveseven', 'flashbang', 'g3sg1', 'galilar', 'glock', 'hammer', 'hkp2000', 'incgrenade', 'knifegg', 'm249', 'm4a1', 'm4a1_silencer', 'mac10', 'mag7', 'molotov', 'mp5sd', 'mp7', 'mp9', 'negev', 'nova', 'p250', 'p90', 'revolver', 'breachcharge', 'bumpmine', 'sawedoff', 'scar20', 'sg556', 'smokegrenade', 'snowball', 'spanner', 'ssg08', 'tagrenade', 'taser', 'tec9', 'ump45', 'usp_silencer', 'xm1014', 'zone_repulsor']

actions = ['hit', 'shot', 'kill']
# actions1 = ['hits', 'shots', 'kills', 'deaths']

actions_coef = [hit = 1, shot = 2, kill = 3]
points1 = (1..50).to_a.sample



# CHALLENGES GENERATOR

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

ap 'CHALLENGES GENERATOR CREATED'



puts 'done'



# challenges3 = Challenge.create!(name: "You need to #{action1} with this #{translate_weapon(gun)} ! " )
# challenges2 = "You need to kill #{kill} before the end of the league ! "
