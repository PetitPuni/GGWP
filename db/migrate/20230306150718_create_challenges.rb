class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.integer :points
      t.integer :key
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
