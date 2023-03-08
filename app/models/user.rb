class User < ApplicationRecord
  has_many :user_leagues
  before_create :set_steam_attributes
  validates :steam_id, presence: true, uniqueness: true

  private

  def set_steam_attributes
    data = FetchSteamAttributesFromSteamId.call(steam_id)
    self.steam_username = data[:username]
    self.steam_image = data[:image]
  end
end
