require 'rails_helper'

RSpec.describe RoomInvitesController, :type => :controller do

  before(:each) do
    User.destroy_all
    @mike = User.create(email: 'michael@michael.com', first_name: 'michael', last_name: 'teevan', password: 'password')
    @dan = User.create(email: 'dan@dan.com', first_name: 'daniel', last_name: 'notdaniel', password: 'd')
    RoomInvite.create(inviter_id: @mike.id, invitee_id: @dan.id)
  end

  describe "GET room_invites#index" do
    it "should return a success status" do
      get :index
      expect(response.status).to eq(200)
    end

    it "should return pending invites for a particular user" do
      get :index
      parsed_response = JSON.parse(response.body)
    end

  end
end