class AddColumnEndValueToUserLeagueChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :user_league_challenges, :end_value, :integer
  end
end
