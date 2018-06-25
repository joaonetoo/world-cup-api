module V1
  class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :update, :destroy]

    # GET /teams
    def index
      @teams = Team.all

      render json: @teams #, include: {group: {only: :name}}
    end

    # GET /teams/1
    def show
      render json: @team, root: true
    end

    # POST /teams
    def create
      @team = Team.new(team_params)

      if @team.save
        render json: @team, status: :created, location: v1_team_url(@team)
      else
        render json: @team.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /teams/1
    def update
      if @team.update(team_params)
        render json: @team
      else
        render json: @team.errors, status: :unprocessable_entity
      end
    end

    # DELETE /teams/1
    def destroy
      @team.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_team
        @team = Team.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def team_params
        params.require(:team).permit(:name,:group_id)
      end
  end
end
