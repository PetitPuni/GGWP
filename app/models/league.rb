class League < ApplicationRecord
  belongs_to :game
  has_many :user_leagues
  has_many :users, through: :user_league
end
