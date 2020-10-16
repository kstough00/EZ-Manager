class PerformancesController < ApplicationController
    before_action :require_login

    def index
        get_artist
        redirect_if_unauthorized
    end

    def new
        get_artist
        redirect_if_unauthorized
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

    def user_authorized?
         @artist.user.id == current_user.id
    end

    def redirect_if_unauthorized
        redirect_to artists_path unless user_authorized?
    end

    def performance_params
        params.require(:performance).permit(:stage_id, :stage, :duration, :description, :artist_id)
    end

end
