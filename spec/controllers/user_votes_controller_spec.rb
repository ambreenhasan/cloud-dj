require 'rails_helper'

RSpec.describe UserVotesController, :type => :controller do

  before(:each) do
    User.destroy_all
    Song.destroy_all
    Room.destroy_all
    UserVote.destroy_all
    @user = User.create(email: "michael@michael.com", first_name: "michael", last_name: "teevan", password: "password")
    @room = Room.create(name: "Aroom",description: "Adesc",publicness: "public",user_id: @user.id)
    @song = Song.create(user_id: @user.id, room_id: @room.id, api_id: "thisisastring")
    @user_vote = UserVote.create(user_id: @user.id,room_id: @room.id,song_id: @song.id)
  end

  describe "GET user_votes#index" do
    it "returns a success status" do
      get :index, :room_id => @room.id
      expect(response.status).to eq(200)
    end

    it "returns all user votes for a song" do
      get :index, :room_id => @room.id
      response
      # parsed_response = JSON.parse(response.body)
      # response_userids = parsed_response.map { |uVotes| uVotes["user_id"] }
      # response_userids
      # last_userVote = UserVote.last

      # expect(response_userids).to include(last_userVote.user_id)
      # expect(parsed_response.length).to eq(UserVote.count)
    end
  end

  describe "POST user_votes#create" do
    it "creates a new user_vote with valid params" do
    end

    it "doesn't create a user_vote if invalid params" do

    end
  end

end



  # user_user_votes POST   /users/:user_id/user_votes(.:format)       user_votes#create
  # room_user_votes GET    /rooms/:room_id/user_votes(.:format)       user_votes#index