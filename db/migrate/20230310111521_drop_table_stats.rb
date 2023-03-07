class DropTableStats < ActiveRecord::Migration[7.0]
  def change
    drop_table :stats
  end
end
