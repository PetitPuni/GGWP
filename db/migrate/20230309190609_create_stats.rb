class CreateStats < ActiveRecord::Migration[7.0]
  def change
    create_table :stats do |t|
      t.string :gameName
      t.string :type
      t.string :name
      t.integer :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
