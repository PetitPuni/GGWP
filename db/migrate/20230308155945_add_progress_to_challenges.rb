class AddProgressToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :progress, :integer
  end
end
