class StagesController < ApplicationController

    def index
        @stages = Stage.all
    end

    def show
        @stage = Stage.find(params[:id])
    end

    def create
        @stage = Stage.create(stage_params)
    end

    def new
        @stage = Stage.new
    end

    def large
        @stages = Stage.large
        render :index
    end

    def small
        @stages = Stage.small
        render :index
    end

    private

    def stage_params
        params.require(:name).permit(:capacity, :artist_id)
    end

end
