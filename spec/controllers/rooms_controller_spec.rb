require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do

  before(:each) do
    User.destroy_all
    Room.destroy_all
    @user = User.create(email: 'michael@michael.com', first_name: 'michael', last_name: 'teevan', password: 'password')
    @room = Room.create(name: 'Aroom',description: 'Adesc',publicness: 'public',user_id: @user.id)
  end

  describe 'GET rooms#index' do
    it 'returns a successful status' do
      get :index, :id => @user.id
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

  describe 'post rooms#create' do
    it 'creates a new room if given valid params' do
      post :create, :user_id => @user.id, format: :json, room: {
        name: 'Broom',
        description: 'Bdesc',
        publicness: 'false',
        user_id: @user.id
      }
      expect(Room.last.name).to eq('Broom')
    end

    it 'does not create a room if given invalid params' do
      expect{post :create, :user_id => @user.id, room: {
        name: '',
        description: 'Bdesc',
        publicness: 'false',
        user_id: @user.id,
      }}.to change{Room.count}.by 0
    end
  end
end