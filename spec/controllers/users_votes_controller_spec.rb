require 'rails_helper'

RSpec.describe UserVotesController, :type => :controller do

  before(:each) do
    User.destroy_all
    Song.destroy_all
    Room.destroy_all
    @user = User.create(email: "michael@michael.com", first_name: "michael", last_name: "teevan", password: "password")
    @room = Room.create(name: "Aroom",description: "Adesc",publicness: "public",user_id: @user.id)
    @song = Song.create(user_id: 1, room_id: 2, api_id: "thisisastring")
    @user_vote = UserVote.create(user_id: 3,room_id: 4,song_id: 5)
  end

  describe "GET user_votes#index" do
    it "returns a success status" do
      get :index, :user_id => @user.id
      expect(response.status).to eq(200)
    end

    it "returns all user votes" do
      get :index, :user_id => @user.id
      parsed_response = JSON.parse(response.body)
      response_userids = parsed_response.map { |uVotes| uVotes["user_id"] }
      response_userids
      last_userVote = UserVote.last

      expect(response_userids).to include(last_userVote.user_id)
      expect(parsed_response.length).to eq(UserVote.count)
    end
  end

  describe "POST user_votes#create" do
    it "" do

    end

    it "" do

    end
  end

end


  #    user_user_votes GET    /users/:user_id/user_votes(.:format)       user_votes#index
  #                    POST   /users/:user_id/user_votes(.:format)       user_votes#create
  # new_user_user_vote GET    /users/:user_id/user_votes/new(.:format)   user_votes#new