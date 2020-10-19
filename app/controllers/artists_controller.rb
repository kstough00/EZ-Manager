class ArtistsController < ApplicationController
    before_action :require_login

    def index
        @artists = current_user.artists
    end

    def new
        @artist = Artist.new #setting a variable to be accessible to the form_for view
    end

    def create
        @artist = current_user.artists.build(artist_params)
        if @artist.save
            redirect_to new_artist_performance_path(@artist)
        else
            render :new
        end
    end

    def update
        if @artist.update(artist_params)
            render :show
        else
            render :edit
        end
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :genre)
    end

end

