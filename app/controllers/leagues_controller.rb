class LeaguesController < ApplicationController
    before_action :set_league, only: %i[show edit update delete]

    def index
        @leagues = League.all
    end

    def show
    end

    def new
        @league = League.new
        @games = Game.all.map { |game| game.name }
    end
    
    def create
        @league = League.new(league_params)
        @league.user = current_user
        if @league.save!
            redirect_to league_path(@league)
        else
            render :new, status: :unrpocessable_entity
        end
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
