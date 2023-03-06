class Game < ApplicationRecord
  has_many :challenges
  has_many :leagues
end
