class AddColumnActionGunEnnemiesToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :ennemies, :integer
    add_column :challenges, :action, :string
    add_column :challenges, :gun, :string
  end
end
