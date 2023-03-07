class League < ApplicationRecord
  belongs_to :game
  has_many :user_leagues
  has_many :challenges, through: :game
end
