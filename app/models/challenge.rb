class Challenge < ApplicationRecord
  belongs_to :game
  has_many :user_league_challenges
end
