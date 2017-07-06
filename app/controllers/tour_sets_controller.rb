# Controller class for Tour Sets
class TourSetsController < ApplicationController
    before_action :set_tour_set, only: [:show, :update, :destroy]

    # GET /tour_sets
    def index
        @tour_sets = TourSet.all

        render json: @tour_sets
    end

    # GET /tour_sets/1
    def show
        render json: @tour_set
    end

    # POST /tour_sets
    def create
        @tour_set = TourSet.new(tour_set_params)

        if @tour_set.save
            render json: @tour_set, status: :created, location: @tour_set
        else
            render json: @tour_set.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /tour_sets/1
    def update
        if @tour_set.update(tour_set_params)
            # render json: @tour_set
            head :no_content
        else
            render json: @tour_set.errors, status: :unprocessable_entity
        end
    end

    # DELETE /tour_sets/1
    def destroy
        @tour_set.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_tour_set
        @tour_set = TourSet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tour_set_params
        params.require(:tour).permit(:title)
    end
end
