# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_13_111401) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "points"
    t.integer "key"
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "ennemies"
    t.string "action"
    t.string "gun"
    t.index ["game_id"], name: "index_challenges_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "app_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "start_on", precision: nil
    t.datetime "end_on", precision: nil
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["game_id"], name: "index_leagues_on_game_id"
  end

  create_table "user_league_challenges", force: :cascade do |t|
    t.string "value", default: "0"
    t.boolean "succes", default: false
    t.bigint "challenge_id", null: false
    t.bigint "user_league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "progress", default: 0
    t.integer "init_user_stat", default: 0
    t.integer "end_value"
    t.index ["challenge_id"], name: "index_user_league_challenges_on_challenge_id"
    t.index ["user_league_id"], name: "index_user_league_challenges_on_user_league_id"
  end

  create_table "user_leagues", force: :cascade do |t|
    t.integer "score", default: 0
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_user_leagues_on_league_id"
    t.index ["user_id"], name: "index_user_leagues_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "steam_username"
    t.string "steam_image"
    t.string "steam_id"
    t.boolean "admin", default: false
  end

  add_foreign_key "challenges", "games"
  add_foreign_key "leagues", "games"
  add_foreign_key "user_league_challenges", "challenges"
  add_foreign_key "user_league_challenges", "user_leagues"
  add_foreign_key "user_leagues", "leagues"
  add_foreign_key "user_leagues", "users"
end
