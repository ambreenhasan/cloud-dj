require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do
  before :each do
    Room.destroy_all
    # Room.create(name: 'Aroom',description: 'Adesc',status: 'public',moderator: 'Amod')
    # Room.create(name: 'Broom',description: 'Bdesc',status: 'private',moderator: 'Bmod')
  end

  describe 'GET room#index' do
    it 'gives a successful response' do
      get :index
      p "HELLO!!!!!"
      expect(response.status).to eq(200)
    end

    it 'assigns @rooms to Room.all' do
      get :index
      expect(assigns(:rooms)).to eq Room.all
    end
  end

  describe 'POST rooms#create' do
    it 'creates a new room' do
      expect{post :users, :user_id => @user.id}.to change{Room.count}.by 1
    end
  end
end