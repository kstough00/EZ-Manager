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

    
end
