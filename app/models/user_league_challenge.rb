class UserLeagueChallenge < ApplicationRecord
  belongs_to :challenge
  belongs_to :user_league

  after_update :update_progress, if: :end_value_previously_changed?

  def update_progress
    return if succes

    gap = end_value - init_user_stat
    objectif = challenge.ennemies
    progress = gap * 100 / objectif
    progress = 100 if progress > 100
    succes = progress == 100
    user_league.update_score!(challenge.points) if succes
    update(progress:, succes:)
  end
end
