class AddColumnProgressToUserLeagueChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :user_league_challenges, :progress, :integer, default: 0
  end
end
