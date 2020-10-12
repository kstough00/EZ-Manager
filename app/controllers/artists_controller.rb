class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def create
        @artist = Artist.create(artist_params)
    end

    def new
        @artist = Artist.new
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :performances, :booked)
    end




end
