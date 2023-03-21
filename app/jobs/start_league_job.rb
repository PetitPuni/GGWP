class StartLeagueJob < ApplicationJob
  queue_as :default

  def perform(league)
    # Do something later
    ap "StartLeagueJob: I'm running!"
    StartLeagueChallenges.call(league:)
  end
end
