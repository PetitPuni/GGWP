# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'destroying all users'

User.destroy_all

puts 'creating user, league, challenge, user_league, user_league_challenge'

user1 = User.create!(
    email: "tata@example.com",
    password: "azerty",
    steam_id: 76561197981067382,
    steam_token: "547F78F8B5B70F2ACE2628433996EE06"
)

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

puts 'done'
