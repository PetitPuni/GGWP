class LeaguesController < ApplicationController
    before_action :set_league, only: %i[show edit update destroy]

    def index
        @leagues = League.all
    end

    def show
        @league = League.find(params[:id])
        @player_rankings = User.joins(user_leagues: { user_league_challenges: :challenge })
                                .where(user_leagues: { league_id: @league.id, user_league_challenges: { succes: true } })
                                .select("users.steam_username, COALESCE(COUNT(DISTINCT challenges.id), 0) AS challenges, COALESCE(SUM(challenges.points), 0) AS score")
                                .group("users.id")
                                .order("score DESC")
    end

    def new
        @league = League.new
        @games = Game.all
    end

    def create
        @league = League.new(league_params)
        if @league.save!
          user_league = UserLeague.new(user: current_user, league: @league)
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

    def destroy
        @league.destroy
        redirect_to leagues_path
    end


    private

    def league_params
        params.require(:league).permit(:name, :description, :start_on, :end_on, :game_id)
    end

    def set_league
        @league = League.find(params[:id])
    end
end
