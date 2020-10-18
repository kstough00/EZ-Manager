class StagesController < ApplicationController
    # before_action :set_stage, only: [:show, :edit, :update, :destroy]

    def index
        @stages = Stage.all
    end

    # def show
    #     @stage = Stage.find(params[:id])
    # end

    def new
        @stage = Stage.new
    end

    def create
        @stage = Stage.new(stage_params)
        if @stage.save
            redirect_to stages_path(@stage)
        else
            render :new
        end
    end

    def stages_large
        @stages = Stage.large
        render :index
    end

    def stages_small
        @stages = Stage.small
        render :index
    end

    private

    # def set_stage
    #     @stage = Stage.find(params[:id])
    # end

    def stage_params
        params.require(:stage).permit(:name, :capacity)
    end

end
