class ChangeColumnTypeToStats < ActiveRecord::Migration[7.0]
  def change
    rename_column :stats, :type, :genre
  end
end
