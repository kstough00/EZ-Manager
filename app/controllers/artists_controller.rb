class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]

    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def new
        @artist = Artist.new #setting a variable to be accessible to the form_for view
    end

    def edit
        
    end

    def create
        @artist = Artist.new(artist_params)
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

    def destroy
        @artist.destroy
        # redirect_to artists_url, notice: 'Artist was successfully destroyed.' }  
    end

    private

    def set_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :genre)
    end

end

