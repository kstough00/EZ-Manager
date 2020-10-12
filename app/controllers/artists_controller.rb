class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def create
        @artist = Artist.new(artist_params)
            if @artist.valid?
                @artist.save
                redirect_to artist_path(@artist)
            else
                flash[:mesage] = "Invalid entry, please try again"
                render :new
            end
    end

    def new
        @artist = Artist.new
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :performances, :booked)
    end




end
