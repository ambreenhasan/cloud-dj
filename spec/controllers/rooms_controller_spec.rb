require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do

  before(:each) do
    User.destroy_all
    Room.destroy_all
    @user = User.create(email: "michael@michael.com", first_name: "michael", last_name: "teevan", password: "password")
    @room = Room.create(name: "Aroom",description: "Adesc",publicness: "public",user_id: @user.id)
  end

  describe "GET rooms#index" do
    it "returns a successful status" do
      get :index, :user_id => @user.id
      expect(response.status).to eq(200)
    end

    it "returns all rooms" do
      get :index
      parsed_response = JSON.parse(response.body)

      response_name = parsed_response.map { |room| room["name"] }
      last_room = Room.last

      expect(response_name).to include(last_room.name)
      expect(parsed_response.length).to eq(Room.count)
    end
  end

  describe "post rooms#create" do
    it "creates a new room if given valid params" do
      post :create, :user_id => @user.id, format: :json, room: {
        name: "Broom",
        description: "Bdesc",
        publicness: "false",
        user_id: @user.id
      }
      expect(Room.last.name).to eq("Broom")
    end

    it "does not create a room if given invalid params" do
      expect{post :create, :user_id => @user.id, room: {
        name: "",
        description: "Bdesc",
        publicness: "false",
        user_id: @user.id,
      }}.to change{Room.count}.by 0
    end
  end

  describe "GET rooms#edit" do
    it "returns a success status" do
      get :edit, :user_id => @user.id, :id => @room.id
      expect(response.status).to eq(200)
      #missing template error
    end

    it "find a specific room" do
      get :edit, :user_id => @user.id, :id => @room.id
      expect(assigns(:room)).to eq(room)
      #missing template error
    end
  end

  describe "GET rooms#show" do
    it "returns a successful status" do
      get :show, :user_id => @user.id, :id => @room.id
      expect(response.status).to eq(200)
      #missing template error
    end

    it "assigns room to @room" do
      get :show, :user_id => @user.id, :id => @room.id
      expect(assigns(:room)).to eq(room)
      #missing template error
    end
  end

  describe "PUT rooms#update" do
    it "finds the room and updates if valid params" do
      @new_attr = {name: "updatedname"}
      put :update, :user_id => @user.id, :id => @room.id, :room => @new_attr
      @room.reload
      expect(@room.name).to eq("updatedname")
      expect(@room.description).to eq("Adesc")
      expect(response).to be_redirect
    end

    it "does not update if invalid params" do
      @new_attr = {name: ""}
      put :update, :user_id => @user.id, :id => @room.id, :room => @new_attr
      @room.reload
      expect(@room.name).to eq("Aroom")
      expect(@room.description).to eq("Adesc")
    end
  end

  describe "DELETE rooms#destroy" do
    it "deletes a specific room" do
      expect {
      delete :destroy, :user_id => @user.id, :id => @room.id
      }.to change {Room.count}.by(-1)
    end

    it "redirects to the rooms index" do
      delete :destroy, :user_id => @user.id, :id => @room.id
      expect(response).to be_redirect
    end
  end
end