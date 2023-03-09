class LeaguesController < ApplicationController
    before_action :set_league, only: %i[show edit update destroy start]

    def index
        @leagues = League.all
    end

    def show
        @challenges = @league.challenges
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

    def start
        @challenges = @league.game.challenges.shuffle().first(5)
        @challenges.each do |challenge|
          @league.user_leagues.each do |user_league|
              UserLeagueChallenge.create!(user_league: user_league, challenge: challenge)
          end
        end
        redirect_to league_path(@league)
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

    def start
        @challenges = @league.game.challenges.shuffle()
        @challenges.each do |challenge|
          @league.user_leagues.each do |user_league|
              UserLeagueChallenge.create!(user_league: user_league, challenge: @challenge)
          end
        end
    end

    private

    def league_params
        params.require(:league).permit(:name, :description, :start_on, :end_on, :game_id)
    end

    def set_league
        @league = League.find(params[:id])
    end


end
