class AddTokenToLeagues < ActiveRecord::Migration[7.0]
  def change
    add_column :leagues, :token, :string
  end
end
