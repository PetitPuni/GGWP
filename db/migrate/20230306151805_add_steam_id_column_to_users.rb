class AddSteamIdColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :steam_id, :integer
  end
end
