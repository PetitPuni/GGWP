class AddColumnToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :app_id, :integer
  end
end
