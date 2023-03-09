class ChangeEndDateToDateAndTimeInLeagues < ActiveRecord::Migration[7.0]
  def change
    change_column :leagues, :end_on, :datetime
    change_column :leagues, :start_on, :datetime
  end
end
