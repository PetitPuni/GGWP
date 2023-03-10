class User < ApplicationRecord
  has_many :user_leagues, dependent: :destroy
  has_many :leagues, through: :user_leagues
  has_many :user_league_challenges, through: :user_leagues
  has_many :challenges, through: :user_league_challenges
  has_many :stats, dependent: :destroy

  before_create :set_steam_attributes
  validates :steam_id, presence: true, uniqueness: true

  private

  def set_steam_attributes
    data = FetchSteamAttributesFromSteamId.call(steam_id)
    self.steam_username = data[:username]
    self.steam_image = data[:image]
  end
end
