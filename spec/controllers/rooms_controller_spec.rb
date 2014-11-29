require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do

  before(:each) do
    User.destroy_all
    Room.destroy_all
    @user = User.create(email: 'michael@michael.com', first_name: 'michael', last_name: 'teevan', password: 'password')
    @room = Room.create(name: 'Aroom',description: 'Adesc',status: 'public',user_id: @user.id)
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


end