class AddColumnInitUserStatToUserLeagueChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :user_league_challenges, :init_user_stat, :integer, default: 0
  end
end
