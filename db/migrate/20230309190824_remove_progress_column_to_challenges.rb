class RemoveProgressColumnToChallenges < ActiveRecord::Migration[7.0]
  def change
    remove_column :challenges, :progress
  end
end
