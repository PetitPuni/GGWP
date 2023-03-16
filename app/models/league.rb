class League < ApplicationRecord
  belongs_to :game
  has_many :user_leagues, dependent: :destroy
  has_many :users, through: :user_leagues
  has_many :user_league_challenges, through: :user_leagues
  has_many :challenges, -> { distinct }, through: :user_league_challenges

  validates :name, presence: true
  validates :description, presence: true
  validates :start_on, presence: true
  validates :end_on, presence: true

  scope :active, -> { where("start_on <= ? AND end_on >= ?", Time.current + 1.hour, Time.current + 1.hour) }

  before_save do
    self.start_on = 2.minutes.from_now + 1.hour
    self.end_on = 4.minutes.from_now + 1.hour
  end

  after_commit :async_update, on: [:create]

  def started?
    start_on <= Time.current + 1.hour
  end

  def ended?
    end_on <= Time.current + 1.hour
  end

  def active?
    started? && !ended?
  end

  def ended?
    end_on <= Time.current
  end

  private

  def async_update
    StartLeagueJob.set(wait_until: start_on - 1.minutes - 1.hour).perform_later(self)
  end
end
