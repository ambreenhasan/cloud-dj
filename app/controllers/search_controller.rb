class SearchController < ApplicationController

  def search
    sc_search
    yt_search
    @user_id = session[:user_id]

    respond_to do |format|
      format.js { render :search_results }
    end
  end

  private

  def sc_search
    sc_client = SoundCloud.new(:client_id => "90bd68b0531687cfd7e24ede5bb5c013")

    sc_query = params[:search][:query]
    @sc_tracks = sc_client.get('/tracks', :q => sc_query, :limit => 15)
    @streamable_songs = []
    @sc_tracks.each do |track|
      if track.streamable == true && @streamable_songs.length < 5
        @streamable_songs << track
      end
    end
    @streamable_songs
  end

  def yt_search
    yt_client = YouTubeIt::Client.new(:dev_key => "AIzaSyAnhBoT9bDXfFK7hOJ6faQhb8lD45Tza8o")

    yt_query = params[:search][:query]

    yt_videos = yt_client.videos_by(:query => yt_query, :page => 1, :per_page => 5)
    @yt_videos = []
    yt_videos.videos.each do |v|
      @yt_videos << v
    end
    @yt_tracks
  end
end