class UserLeagueChallenge < ApplicationRecord
  belongs_to :challenge
  belongs_to :user_league
  validates :succes, presence: true
end
