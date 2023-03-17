class User < ApplicationRecord
  has_many :user_leagues, dependent: :destroy
  has_many :leagues, through: :user_leagues
  has_many :user_league_challenges, through: :user_leagues
  has_many :challenges, through: :user_league_challenges
  has_many :stats, dependent: :destroy

  before_create :set_steam_attributes
  validates :steam_id, presence: true, uniqueness: true

  def completed_challenges_count
    user_league_challenges.where(succes: true).count
  end

  def rank
    case completed_challenges_count
    when 0..9
      "Rookie 🧒🏻"
    when 10..20
      "Demi-God 🔱"
    else
      "Almighty ❤️‍🔥"
    end
  end

  private

  def set_steam_attributes
    if steam_id.size > 10
      data = FetchSteamAttributesFromSteamId.call(steam_id)
      self.steam_username = data[:username]
      self.steam_image = data[:image]
    end
  end
end
