class UpdateLeagueJob < ApplicationJob
  queue_as :default
  def perform(league)
    # Do something later
    UpdateLeagueChallenges.call(league: league)
  end
end
