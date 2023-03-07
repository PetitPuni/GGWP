class UserLeague < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :user_league_challenges
  validates :user_id, :league_id, presence: true
  validates :user_id, uniqueness: { scope: :league_id }
end
