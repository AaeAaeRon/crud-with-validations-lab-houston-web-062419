class SongsController < ApplicationController

    before_action :find_song, only: [:show, :edit, :destroy, :update]

    def index
        @songs = Song.all

    end

    def show
    end
    
    def edit
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to @song
        else
            render :new
        end
    end

    def update
        @song.assign_attributes(song_params)
        if @song.valid?
            @song.update(song_params)
            redirect_to @song
        else
            render :edit
        end

    end

    def destroy
        @song.destroy
        redirect_to songs_path
    end 

    private

    def song_params
        params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
    end

    def find_song
        @song = Song.find(params[:id])
    end

end
