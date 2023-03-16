class BroadcastLeagueChallengesJob < ApplicationJob
  queue_as :default

  def perform(league)
    # Do something later
    ap "StartLeagueJob: I'm running!"
    BroadcastLeagueChallenges.call(league: league)
  end
end
