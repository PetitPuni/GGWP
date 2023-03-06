class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :steam_token, :string
    add_column :users, :steam_username, :string
    add_column :users, :steam_image, :string
  end
end
