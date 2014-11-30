require 'rails_helper'

RSpec.describe RoomInvitesController, :type => :controller do

  before(:each) do
    User.destroy_all
    RoomInvite.destroy_all
    @mike = User.create(email: 'michael@michael.com', first_name: 'michael', last_name: 'teevan', password: 'password')
    @dan = User.create(email: 'dan@dan.com', first_name: 'daniel', last_name: 'notdaniel', password: 'd')
    @invite = RoomInvite.create(inviter_id: @mike.id, invitee_id: @dan.id, room_id: 1)
  end

  describe "GET room_invites#index" do
    it "should return a success status" do
      get :index, :user_id => @mike.id
      expect(response.status).to eq(200)
    end

    it "should return pending invites for a particular user" do
      get :index, :user_id => @mike.id
      last_response = JSON.parse(response.body)
      response_id = last_response.map { |invite| invite["inviter_id"] }

      invites_extended = @mike.invites_extended
      invites_received = @mike.invites_received
      total = invites_extended.count + invites_received.count

      invites_extended.each do |invite_extended|
        expect(response_id).to include(invite_extended.inviter_id)
      end
      expect(last_response.length).to eq(total)
    end
  end

  describe 'POST room_invite#create' do
    it "should create a room invite" do
      expect{ post :create, :user_id => @mike.id, format: :json, room_invite: {
        inviter_id: @mike.id,
        invitee_id: @dan.id,
        room_id: 1,
        accepted: 'false'
      }}.to change{ RoomInvite.count }.by 1
    end
  end

  describe "DELETE room_invite#destroy" do
    it "deletes an invite" do
      expect{ delete :destroy, :user_id => @mike.id, :id => @invite.id }.to change{ RoomInvite.count }.by 1
    end
  end

end