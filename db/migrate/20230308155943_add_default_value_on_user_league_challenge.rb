class AddDefaultValueOnUserLeagueChallenge < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_league_challenges, :value, 0
    change_column_default :user_league_challenges, :succes, false
  end
end
