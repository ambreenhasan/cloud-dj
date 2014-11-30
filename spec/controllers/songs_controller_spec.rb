require 'rails_helper'

RSpec.describe SongsController, :type => :controller do

  before(:each) do
    Song.destroy_all
    User.destroy_all
    Room.destroy_all
    @user = User.create(email: "michael@michael.com", first_name: "michael", last_name: "teevan", password: "password")
    @room = Room.create(name: "Aroom",description: "Adesc",publicness: "public",user_id: @user.id)
    @song = Song.create(user_id: 1, room_id: 2, api_id: "thisisastring")
  end

  describe "GET songs#index" do
    it "returns a successful status" do
      get :index, :user_id => @user.id
      expect(response.status).to eq(200)
    end

    it "returns all songs" do
      get :index, :user_id => @user.id
      parsed_response = JSON.parse(response.body)

      response_userid = parsed_response.map { |song| song["user_id"] }
      last_song = Song.last
      expect(response_userid).to include(last_song.user_id)
      expect(parsed_response.length).to eq(Song.count)
    end
  end

  describe "POST songs#create" do
    it "creates a new song when given valid params" do
      post :create, :user_id => @user.id, format: :json, song: {
        user_id: 3,
        room_id: 4,
        api_id: "thisisastring"
      }
      expect(Song.last.room_id).to eq(4)
    end

    it "doesn't create a song if invalid params" do
      expect{ post :create, :user_id => @user.id, format: :json, song: {
        user_id: "not a number!",
        room_id: 4,
        api_id: "thisisastring"
      }}.to change{Song.count}.by 0
    end
  end

  describe "GET songs#edit" do
    it "returns a successful status" do
      get :edit, :user_id => @user.id, :id => @song.id
      expect(response.status).to eq(200)
      #missing template error
    end

    it "assigns song to @song" do
      get :edit, :user_id => @user.id, :id => @song.id
      expect(assigns(:song)).to eq(song)
      #missing template error
    end
  end

  describe "GET songs#show" do
    it "returns a successful status" do
      get :edit, :user_id => @user.id, :id => @song.id
      expect(response.status).to eq(200)
      #missing template error
    end

    it "assigns song to @song" do
      get :edit, :user_id => @user.id, :id => @song.id
      expect(assigns(:song)).to eq(song)
      #missing template error
    end
  end

end