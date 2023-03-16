namespace :demoday do
  task fake: :environment do
    league = League.find_by(name: 'totototototo')
    if league
      league.update(end_on: Time.current + 1.hour + 30.seconds)
    end
  end

end
