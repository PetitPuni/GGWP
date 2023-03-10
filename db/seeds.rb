# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'destroying all'



game = Game.create!(
  name: "Counter-Strike: Global Offensive",
  genre: "FPS",
  description: "Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago. CS: GO features new maps, characters, and weapons and delivers updated versions of the classic CS content (de_dust, etc.). In addition, CS: GO will introduce new gameplay modes, matchmaking, leader boards, and more.",
  app_id: 730
)

ap 'user_league_challenge created'

#  VARIABLE USED FOR THE CHALLENGE GENERATOR

guns = ['ak47', 'aug', 'awp', 'axe', 'bizon', 'c4', 'cz75a', 'deagle', 'decoy', 'elite', 'famas', 'fists', 'fiveseven', 'flashbang', 'g3sg1', 'galilar', 'glock', 'hammer', 'hkp2000', 'incgrenade', 'knifegg', 'm249', 'm4a1', 'm4a1_silencer', 'mac10', 'mag7', 'molotov', 'mp5sd', 'mp7', 'mp9', 'negev', 'nova', 'p250', 'p90', 'revolver', 'breachcharge', 'bumpmine', 'sawedoff', 'scar20', 'sg556', 'smokegrenade', 'snowball', 'spanner', 'ssg08', 'tagrenade', 'taser', 'tec9', 'ump45', 'usp_silencer', 'xm1014', 'zone_repulsor']

actions = ['hit', 'shot', 'kill']
actions1 = ['hits', 'shots', 'kills', 'deaths']


# CHALLENGES GENERATOR

challenges3 =
actions.each do |action|
  guns.each do |gun|
    ennemies = (1..50).to_a.sample
    challenge = Challenge.create!(
      name: "#{ApplicationController.helpers.action_capitalize(action)} #{ennemies} #{ApplicationController.helpers.translate_weapon(gun)}",
      description: "Pour cette mission si vous l'acceptez you need to #{ApplicationController.helpers.action_capitalize(action)} #{ennemies} ennemies with this #{ApplicationController.helpers.translate_weapon(gun)} !",
      points: (1..100).to_a.sample,
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
