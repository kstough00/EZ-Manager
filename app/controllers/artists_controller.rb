class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]

    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def new
        @artist = Artist.new
    end

    def edit
    end

    def create
        @artist = Artist.new(artist_params)
        redirect_to @artist, notice: 'Artist was successfully created.'
    end

    def destroy
        @artist.destroy
        redirect_to artists_url, notice: 'Artist was successfully destroyed.' }  
    end

    private

    def set_artist
        @artist = Artist.find(params[:id])
      end

    def artist_params
        params.require(:artist).permit(:name, :performances, :booked)
    end

end
