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
