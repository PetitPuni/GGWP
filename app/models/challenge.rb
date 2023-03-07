class Challenge < ApplicationRecord
  belongs_to :game
  has_many :user_league_challenges
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :points, presence: true
end
