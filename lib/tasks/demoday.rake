namespace :demoday do
  task fake: :environment do
    league = League.find_by(name: 'Wacky Wipeout')
    league.update!(start_on: 2.weeks.ago, end_on: Time.current + 1.hour + 30.seconds) if league
  end
end
