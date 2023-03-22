class PrestartLeagueJob < ApplicationJob
  queue_as :default

  def perform(league)
    # Do something later
    ap "StartLeagueJob: I'm running!"
    PrestartLeagueChallenges.call(league:)
  end
end
