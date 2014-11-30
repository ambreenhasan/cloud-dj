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

  # describe "POST user_votes#create" do
  #   it "creates a new user_vote with valid params" do
  #   end

  #   it "doesn't create a user_vote if invalid params" do

  #   end
  # end

end



  # user_user_votes POST   /users/:user_id/user_votes(.:format)       user_votes#create
  # room_user_votes GET    /rooms/:room_id/user_votes(.:format)       user_votes#index