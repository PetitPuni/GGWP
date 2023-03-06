class CreateLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :description
      t.date :start_on
      t.date :end_on
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
