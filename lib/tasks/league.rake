namespace :league do
  desc "Enrich all leagues with Clearbit (async)"
  task update_all: :environment do
    leagues = League.active.where.not(name: 'Wacky Wipeout')
    puts "Enqueuing update of #{leagues.size} leagues..."
    leagues.each do |league|
      FakeHerokuJob.perform_later(league)
    end
  end
end
