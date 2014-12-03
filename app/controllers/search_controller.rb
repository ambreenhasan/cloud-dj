class SearchController < ApplicationController

  def search
    sc_search
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
      if track.streamable == true && @streamable_songs.length < 10
        @streamable_songs << track
      end
    end
    @streamable_songs
  end
end