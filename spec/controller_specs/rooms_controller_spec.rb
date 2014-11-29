require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do
  before :each do
    Room.destroy_all
  end

  describe 'GET room#index' do
    it 'gives a successful response' do
      p "HELLO!!!!!"
      expect(response.status).to eq(200)
    end

    # it 'returns a list of all existing rooms' do
    #   Room.create(name: 'Aroom',description: 'Adesc',status: 'public',moderator: 'Amod')
    #   Room.create(name: 'Broom',description: 'Bdesc',status: 'private',moderator: 'Bmod')
    #   get :index
    # end
  end
end