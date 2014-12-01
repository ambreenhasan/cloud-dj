class YoutubeController < ApplicationController

  def search
    query = params[:search][:query]
    client = YouTubeIt::Client.new(:dev_key => "AIzaSyAnhBoT9bDXfFK7hOJ6faQhb8lD45Tza8o")
    videos = client.videos_by(:query => query)
    @titles = []
    @video_ids = []
    @descriptions = []
    videos.videos.each do |v|
      @titles << v.title
      @video_ids << v.video_id
      @descriptions << v.description
    end
    respond_to do |format|
      format.js { render :youtube }
    end
  end
end
