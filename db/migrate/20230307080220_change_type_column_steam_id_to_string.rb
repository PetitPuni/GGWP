class ChangeTypeColumnSteamIdToString < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :steam_id, :string
  end
end
