class PerformancesController < ApplicationController
    before_action :require_login
    before_action :get_artist, only: [:index, :new]

    def index
        redirect_invalid_request
    end

    def new
        redirect_invalid_request
        @performance = Performance.new
    end

    def create
        @artist = Artist.find_by(id: params[:performance][:artist_id])
        if user_authorized?
            @performance = Performance.new(performance_params)
            if @performance.save
                redirect_to artist_performances_path(@performance.artist)
            else
                render :new
            end
        else
            redirect_to artists_path
        end
    end
    
    private

    def get_artist
        @artist ||= Artist.find_by(id: params[:artist_id])
    end

    def user_authorized?
         @artist.user && (@artist.user_id == current_user.id)
    end

    def redirect_invalid_request
        if @artist.nil? || !user_authorized?
            redirect_to sequences_path
        end
    end

    def performance_params
        params.require(:performance).permit(:stage_id, :stage, :duration, :description, :artist_id)
    end

end
