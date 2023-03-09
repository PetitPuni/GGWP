class ChangeDefaultValueScoreToUserLeagues < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_leagues, :score, 0
  end
end
