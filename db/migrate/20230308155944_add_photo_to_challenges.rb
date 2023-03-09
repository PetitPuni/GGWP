class AddPhotoToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :photo, :string
  end
end
