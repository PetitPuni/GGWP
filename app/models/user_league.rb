class UserLeague < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :user_league_challenges, dependent: :destroy

  validates :league, uniqueness: { scope: :user }
end
