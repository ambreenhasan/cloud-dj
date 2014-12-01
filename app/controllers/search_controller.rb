class SearchController < ApplicationController

    # tracks.each do |track|
    #   puts track
    # end
    # render json: tracks

    # respond_to do |format|
    #   format.js { render :youtube }
    # end
  def search
    p params
  end

  def sc_search
    sc_client = SoundCloud.new(:client_id => "90bd68b0531687cfd7e24ede5bb5c013")

    p "searching soundcloud:"
    p sc_query = params[:query]
    p "&" *70
    @sc_tracks = client.get('/tracks', :q => sc_query, :limit => 5)
    p @sc_tracks
  end

  def yt_search
    yt_client = YouTubeIt::Client.new(:dev_key => "AIzaSyAnhBoT9bDXfFK7hOJ6faQhb8lD45Tza8o")

    p "searching youtube:"
    p yt_query = params[:search][:query]
    p "&" *70

    yt_videos = client.videos_by(:query => yt_query, :page => 1, :per_page => 5)
    @yt_videos = []
    yt_videos.videos.each do |v|
      @yt_videos << v
    end

    p @yt_videos
  end
end