class SongsController < ApplicationController
  before_action :set_billboard
  def index
    @songs = @billboard.songs
  end

  def show
  end

  def new
    @artists = Artist.all
    @song = @billboard.songs.new
    render partial: 'form'
  end

  def create
    @song = @billboard.songs.new(song_params)

    if @song.save
      redirect_to billboard_songs_path
    else
      render :new
    end
  end

  def destroy
    song = @billboard.songs.find(params[:id])
    song.destroy
    redirect_to billboard_songs_path(@billboard)
  end

private

  def set_billboard
    @billboard = Billboard.find(params[:billboard_id])
  end

  def song_params
    params.require(:song).permit(:name, :artist, :artist_id)
  end
end
