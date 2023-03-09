class Game < ApplicationRecord
  has_many :challenges, dependent: :destroy
  has_many :leagues, dependent: :destroy
end
