module V1
  class StadiumsController < ApplicationController
    before_action :set_stadium, only: [:show, :update, :destroy]

    # GET /stadiums
    def index
      @stadiums = Stadium.all

      render json: @stadiums
    end

    # GET /stadiums/1
    def show
      render json: @stadium
    end

    # POST /stadiums
    def create
      @stadium = Stadium.new(stadium_params)

      if @stadium.save
        render json: @stadium, status: :created, location: v1_stadium_url(@stadium)
      else
        render json: @stadium.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /stadiums/1
    def update
      if @stadium.update(stadium_params)
        render json: @stadium
      else
        render json: @stadium.errors, status: :unprocessable_entity
      end
    end

    # DELETE /stadiums/1
    def destroy
      @stadium.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_stadium
        @stadium = Stadium.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def stadium_params
        params.require(:stadium).permit(:name,:city)
      end
  end
end
