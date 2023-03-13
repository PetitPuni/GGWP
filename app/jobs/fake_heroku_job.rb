class FakeHerokuJob < ApplicationJob
  DELAY = 1.minute
  # DELAY = 10.seconds

  queue_as :default

  def perform(league)
    puts "FakeHerokuJob: I'm running!"

    10.times do |i|
      UpdateLeagueJob.set(wait: (DELAY * i)).perform_later(league)
    end
  end
end
