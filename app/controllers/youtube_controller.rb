class YoutubeController < ApplicationController

  def search
    query = params[:search][:query]
    client = YouTubeIt::Client.new(:dev_key => "AIzaSyAnhBoT9bDXfFK7hOJ6faQhb8lD45Tza8o")
    videos = client.videos_by(:query => query)
    @videos = []
    videos.videos.each do |v|
      @videos << v
    end
    respond_to do |format|
      format.js { render :youtube }
    end
  end
end
