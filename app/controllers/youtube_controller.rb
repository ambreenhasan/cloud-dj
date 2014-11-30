class YoutubeController < ApplicationController

  def search
    query = params[:query]
    client = YouTubeIt::Client.new(:dev_key => "AIzaSyAnhBoT9bDXfFK7hOJ6faQhb8lD45Tza8o")
    videos = client.videos_by(:query => query)
    render json: videos
  end
end
