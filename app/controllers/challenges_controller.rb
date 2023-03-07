class ChallengesController < ApplicationController
  before_action :set_league

  def index
    @challenges = @league.challenges
    @fake_challenge = Challenge.new(
      name: "Fake Challenge",
      description: "This is a fake challenge",
      points: 50,
      photo: "https://via.placeholder.com/150",
      progress: 100
    )
    @fake_challenge1 = Challenge.new(
      name: "Fake Challenge",
      description: "This is a fake challenge",
      points: 50,
      photo: "https://via.placeholder.com/150",
      progress: 25
    )
    @fake_challenge2 = Challenge.new(
      name: "Fake Challenge",
      description: "This is a fake challenge",
      points: 50,
      photo: "https://via.placeholder.com/150",
      progress: 70

    )
    @challenges.each do |challenge|
      completed_tasks = challenge.tasks.completed.count
      total_tasks = challenge.tasks.count
      progress = total_tasks == 0 ? 0 : completed_tasks / total_tasks.to_f * 100
      challenge.progress = progress.to_i
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  private

  def set_league
    @league = League.find(params[:league_id])
  end
end


# Faire un tableau avec les kills / Hit
# Faire un tableau avec les pistolets
# .sample de chacun des tableaux
# Save dans la db du challenge les clés (action + pistolets)


# Save les stats initial

# Un bouton 'start League' dans le show de la league.
# Le bouton lance la génération de challenge.
# Génération d'un user_league_challenge qui vient faire un call de l'API pour récuperer dans les stats la ligne qui match avec les deux samples. User_league_challengeI. Le moment du lancement des challenges il faut save le moment de création dans user_league_challenge.
#
