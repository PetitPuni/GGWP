class UserLeague < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :user_league_challenges, dependent: :destroy

  validates :league, uniqueness: { scope: :user }

  def update_score!(points)
    ap "nombre de points"
    a = points
    ap "score actuel"
    b = score
    score = a + b
    update(score:)
  end
end
