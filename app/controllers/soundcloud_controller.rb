class SoundcloudController < ApplicationController

  def search
    p params
    query = params[:query]
    p "&" *70
    client = SoundCloud.new(:client_id => "90bd68b0531687cfd7e24ede5bb5c013")
    tracks = client.get('/tracks', :q => query, :limit => 10)
    # tracks.each do |track|
    #   puts track
    # end
    render json: tracks
  end
end
