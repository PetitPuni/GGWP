class UserLeague < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :league, dependent: :destroy
  has_many :user_league_challenges, dependent: :destroy

  validates :league, uniqueness: { scope: :user }
end
