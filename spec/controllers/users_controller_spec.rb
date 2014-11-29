require 'rails_helper'
require 'json'

RSpec.describe UsersController, :type => :controller do

  before(:each) do
    User.create(email: 'michael@michael.com', first_name: 'michael', last_name: 'teevan', password: 'password')
    User.create(email: 'dan@dan.com', first_name: 'daniel', last_name: 'notdaniel', password: 'd')
  end

  describe "users#index" do
    it "should return a success status" do
      get :index
      expect(response.status).to eq(200)
    end

    it "should return all users" do
      get :index
      #-------
      p response.body
      #-------

      response_firstname = response.map { |user| user["first_name"] }
      last_user = User.last

      expect(response_username).to include(last_user.first_name)
      expect(response.length).to eq(User.count)
    end
  end
end
