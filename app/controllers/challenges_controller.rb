class ChallengesController < ApplicationController
    before_action :set_league

    def index
      @challenges = @league.challenges
    end

    def show
      @challenge = Challenge.find(params[:id])
    end


    private 

    def set_league
      @league = League.find(params[:league_id])
    end
end

guns = ['ak47', 'aug', 'awp', 'axe', 'bizon', 'c4', 'cz75a', 'deagle', 'decoy', 'elite', 'famas', 'fists', 'fiveseven', 'flashbang', 'g3sg1', 'galilar', 'glock', 'hammer', 'healthshot', 'hkp2000', 'incgrenade', 'knife', 'knife_ghost', 'knife', 'knifegg', 'm249', 'm4a1', 'm4a1_silencer', 'mac10', 'mag7', 'melee', 'molotov', 'mp5sd', 'mp7', 'mp9', 'negev', 'nova', 'p250', 'p90', 'revolver', 'breachcharge', 'bumpmine', 'sawedoff', 'scar20', 'sg556', 'shield', 'smokegrenade', 'snowball', 'spanner', 'ssg08', 'tagrenade', 'taser', 'tec9', 'ump45', 'usp_silencer', 'xm1014', 'zone_repulsor'].sample

# action1 = ['hits', 'shots', 'kills' ].sample
# actions = ['hits', 'shots', 'kills', 'deaths' ]

# actions.each do |action|
#   guns.each do |gun|
#     Challenge.create!("You need to #{action} with this #{translate_weapon(gun)} !")
#   end
# end


# challenges1 = Challenge.create!(name: "You need to #{action} with this #{translate_weapon(gun)} ! " )
# challenges2 = "You need to kill #{kill} before the end of the league ! "

# Faire un tableau avec les kills / Hit
# Faire un tableau avec les pistolets
# .sample de chacun des tableaux
# Save dans la db du challenge les clés (action + pistolets)


# Save les stats initial

# Un bouton 'start League' dans le show de la league.
# Le bouton lance la génération de challenge. 
# Génération d'un user_league_challenge qui vient faire un call de l'API pour récuperer dans les stats la ligne qui match avec les deux samples. User_league_challengeI. Le moment du lancement des challenges il faut save le moment de création dans user_league_challenge.
# 