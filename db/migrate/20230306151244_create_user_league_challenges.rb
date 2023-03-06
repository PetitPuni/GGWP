class CreateUserLeagueChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :user_league_challenges do |t|
      t.string :value
      t.boolean :succes
      t.references :challenge, null: false, foreign_key: true
      t.references :user_league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
