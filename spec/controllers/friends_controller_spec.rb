require 'rails_helper'

RSpec.describe FriendsController, :type => :controller do

  before(:each) do
    User.destroy_all
    Friend.destroy_all
    @michael = User.create(email: "michael@michael.com", first_name: "michael", last_name: "teevan", password: "password")
    @mike = User.create(email: "mike@michael.com", first_name: "mike", last_name: "teevan", password: "password")
    @mike2 = User.create(email: "mike2@michael.com", first_name: "mike2", last_name: "teevan", password: "password")
    @friend = Friend.create(inviter_id: @michael.id, invitee_id: @mike.id)
    @friend2 = Friend.create(inviter_id: @michael.id, invitee_id: @mike2.id)
  end

  describe "GET friends#index" do
    it "returns a successful status" do
      get :index, :user_id => @michael.id, format: :json
      expect(response.status).to eq(200)
    end

    it "returns a list of friends for a user" do
      get :index, :user_id => @michael.id

      parsed_response = JSON.parse(response.body)
      response_invitees = parsed_response.map { |friend| friend["invitee_id"] }

      expect(response_invitees).to include @mike.id
      expect(response_invitees).to include @mike2.id
    end
  end

  describe "POST friends#create" do
    it "" do

    end
  end

end