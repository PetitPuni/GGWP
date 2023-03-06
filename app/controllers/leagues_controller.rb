class LeaguesController < ApplicationController
    before_action :set_league, only: %i[show edit update delete]

    def index
        @leagues = League.all
    end

    def show
    end

    def new
        @league = League.new
    end
    
    def create
        League.create(league_params)
    end
    
    
    def edit
    end
    
    def update 
        @league.update(league_params)
    end

    def delete
        @league.destroy
    end

    private

    def league_params
        params.require(:league).permit(:name, :description, :start_on, :end_on)
    end

    def set_league
        @league = League.find(params[:id])
    end
end
