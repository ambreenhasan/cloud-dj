require 'youtube_it'

class YoutubeController < ApplicationController

  def search
    client = YouTubeIt::Client.new(:dev_key => "AIzaSyAnhBoT9bDXfFK7hOJ6faQhb8lD45Tza8o")
    videos = client.videos_by(:query => "penguin")

    render json: videos
    # p params
    # query = params[:query]
    # p "&" *70
    # client = SoundCloud.new(:client_id => "90bd68b0531687cfd7e24ede5bb5c013")
    # render json: tracks
  end
end
