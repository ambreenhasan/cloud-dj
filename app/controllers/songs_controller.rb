class SongsController < ApplicationController
  def index
    @songs = Song.all
    render json: @songs
  end

  def create
    @song = Song.new(song_params)
    p "Printing params:"
    p params
    respond_to do |f|
      if @song.save

        flash[:notice] = "Song added to database"
        f.json { render json: @song }
      else
        f.json { redirect_to user_songs_path }
        f.html { redirect_to user_songs_path, notice: "Failed to save"}
      end
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to user_songs_path
  end

  private

  def song_params
    params.require(:song).permit(:user_id, :api_id, :title)
  end

end