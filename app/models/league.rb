class League < ApplicationRecord
  belongs_to :game
  has_many :user_leagues, dependent: :destroy
  has_many :users, through: :user_leagues
  has_many :challenges, through: :game
  validates :name, presence: true
  validates :game, presence: true
  # validates :user_leagues, length: { minimum: 2 }
  validates :description, presence: true
  validates :start_on, presence: true
  validates :end_on, presence: true
end
