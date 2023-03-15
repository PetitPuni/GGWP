class UpdateLeagueJob < ApplicationJob
  queue_as :default
  def perform(league)
    # Do something later
    ap "UpdateLeagueJob: I'm running!"
    ap league
    # UpdateLeagueChallenges.call(league: league)
  end
end
