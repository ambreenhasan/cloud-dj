require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  before(:each) do
    User.destroy_all
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
      parsed_response = JSON.parse(response.body)

      response_firstname = parsed_response.map { |user| user["first_name"] }
      last_user = User.last

      expect(response_firstname).to include(last_user.first_name)
      expect(parsed_response.length).to eq(User.count)
    end
  end
end
