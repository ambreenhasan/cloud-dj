require 'rails_helper'

RSpec.describe UserVotesController, :type => :controller do

  before(:each) do
    User.destroy_all
    Song.destroy_all
    Room.destroy_all
    UserVote.destroy_all

    @mike = User.create(email: "michael@michael.com", first_name: "michael", last_name: "teevan", password: "password")
    @room = Room.create(name: "Aroom", description: "Adesc", publicness: "public", user_id: @mike.id)
    10.times do
      Song.create(user_id: @mike.id, room_id: @room.id, api_id: "#{rand(1..100)}")
    end
    @song = Song.last
    10.times do
      UserVote.create(user_id: @mike.id, room_id: @room.id, song_id: "#{rand(1..100)}")
    end
  end

  describe "GET user_votes#index" do
    it "returns a success status" do
      get :index, :room_id => @room.id
      expect(response.status).to eq(200)
    end

    it "returns all votes made in room" do
      get :index, :room_id => @room.id
      last_response = JSON.parse(response.body)
      response_rooms = last_response.map { |room| room["room_id"] }
      song_votes = @room.user_votes

      song_votes.each do |vote|
        expect(response_rooms).to include(vote.room_id)
      end
      expect(last_response.count).to eq(song_votes.count)
    end
  end

  describe "POST user_votes#create" do
    it "creates a new user_vote" do
      expect{ post :create, :user_id => @mike.id, format: :json, user_vote: {
        user_id: @mike.id,
        song_id: @song.id,
        room_id: @room.id
        }}.to change{ @room.user_votes.count }.by 1
    end
  end

end