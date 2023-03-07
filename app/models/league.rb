class League < ApplicationRecord
  belongs_to :game
  has_many :user_leagues
  has_many :challenges, through: :game
  validates :name, presence: true
  validates :game, presence: true
  validates :user_leagues, length: { minimum: 2 }
  validates :description, presence: true
end
