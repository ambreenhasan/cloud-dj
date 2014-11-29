require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do

  # before :each do
  #   Room.destroy_all
  # end

  describe 'GET rooms#index' do
    it 'returns a successful status' do
      expect(response.status).to eq(200)
    end
  end
  #   it 'returns a list of all existing rooms' do
  #     get :index
  #     Room.create(name: 'Aroom',description: 'Adesc',status: 'public',moderator: 'Amod')
  #     Room.create(name: 'Broom',description: 'Bdesc',status: 'private',moderator: 'Bmod')
  #     p "hi"
  #     # expect(Room.count).to eq(2)
  #   end
  # end

end