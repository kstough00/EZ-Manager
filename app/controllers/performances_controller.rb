class PerformancesController < ApplicationController

    def index
        get_artist
    end

    def new
        get_artist
        @performance = Performance.new
    end

    def create
        @artist = Artist.find_by(id: params[:performance][:artist_id])
        @performance = Performance.new(performance_params)
        if @performance.save
            redirect_to artist_performances_path(@performances.artist)
        else
            render :new
    end
end




    private

    def get_artist
        @artist ||= Artist.find_by(id: params[:artist_id])
    end

    def performance_params
        params.require(:performance).permit(:stage_id, :duration, :description, :artist_id)
    end



end
