class UserLeague < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :user_league_challenges
  validates :score, presence: true
end
