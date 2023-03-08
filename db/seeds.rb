# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'destroying all'

User.destroy_all
Game.destroy_all
League.destroy_all
Challenge.destroy_all
UserLeague.destroy_all
UserLeagueChallenge.destroy_all

puts 'creating user, league, challenge, user_league, user_league_challenge'

user1 = User.create!(
  steam_id: '76561197981067382'
)

ap User.all

 ap 'user created'
 game = Game.create!(
   name: "Counter-Strike: Global Offensive",
   genre: "FPS",
   description: "Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago. CS: GO features new maps, characters, and weapons and delivers updated versions of the classic CS content (de_dust, etc.). In addition, CS: GO will introduce new gameplay modes, matchmaking, leader boards, and more.",
   app_id: 730
 )

 ap 'game created'

 league = League.create!(
   name: "League 1",
   description: "the first league of the batch #1102",
   start_on: Date.today,
   end_on: Date.today + 1.month,
   game: game
 )

 ap 'league created'

 challenge = Challenge.create!(
   name: "Kill 10 enemies",
   description: "Kill 10 enemies with a pistol",
   points: 10,
   key: 1,
   game: game
 )

 challenge1 = Challenge.create!(
   name: "defuse the bomb",
   description: "defuse the bomb",
   points: 10,
   key: 2,
   game: game
 )

 challenge2 = Challenge.create!(
   name: "plant the bomb",
   description: "plant the bomb",
   points: 10,
   key: 3,
   game: game
 )

 ap 'challenge created'

 user_league = UserLeague.create!(
   score: 0,
   user: user1,
   league: league
 )

 ap 'user_league created'

 UserLeagueChallenge.create!(
   succes: false,
   challenge: challenge,
   user_league: user_league
 )

 UserLeagueChallenge.create!(
   succes: false,
   challenge: challenge1,
   user_league: user_league
 )

 UserLeagueChallenge.create!(
   succes: false,
   challenge: challenge2,
   user_league: user_league
 )


 ap 'user_league_challenge created'

#  VARIABLE USED FOR THE CHALLENGE GENERATOR

guns = ['ak47', 'aug', 'awp', 'axe', 'bizon', 'c4', 'cz75a', 'deagle', 'decoy', 'elite', 'famas', 'fists', 'fiveseven', 'flashbang', 'g3sg1', 'galilar', 'glock', 'hammer', 'hkp2000', 'incgrenade', 'knifegg', 'm249', 'm4a1', 'm4a1_silencer', 'mac10', 'mag7', 'melee', 'molotov', 'mp5sd', 'mp7', 'mp9', 'negev', 'nova', 'p250', 'p90', 'revolver', 'breachcharge', 'bumpmine', 'sawedoff', 'scar20', 'sg556', 'smokegrenade', 'snowball', 'spanner', 'ssg08', 'tagrenade', 'taser', 'tec9', 'ump45', 'usp_silencer', 'xm1014', 'zone_repulsor'].sample

action1 = ['hit', 'shot', 'kill' ].sample
actions = ['hits', 'shots', 'kills', 'deaths' ]

ennemies = [1..50].sample

# CHALLENGES GENERATOR

challenges3 = 
actions.each do |action|
  guns.each do |gun|
    Challenge.create!(
      name: "You need to #{action} #{ennemies} ennemies with this #{translate_weapon(gun)} !",
      description: , 
      points: [1..100].sample,
      game: game
    )
  end
end

ap 'CHALLENGES GENERATOR CREATED'


# challenges3 = Challenge.create!(name: "You need to #{action1} with this #{translate_weapon(gun)} ! " )
# challenges2 = "You need to kill #{kill} before the end of the league ! "

challenge2 = Challenge.create!(
  name: "plant the bomb",
  description: "plant the bomb",
  points: 10,
  key: 3,
  game: game
)

  puts 'done'
