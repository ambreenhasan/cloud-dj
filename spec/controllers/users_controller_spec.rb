require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  before(:each) do
    User.create(email: 'michael@michael.com', first_name: 'michael', last_name: 'teevan', password: 'password')
  end

  describe "users#index" do
    it "should return all users" do
      get :index
      response = JSON.parse(last_response.body)
      response_firstname = response.map { |user| user["first_name"] }

      last_user = User.last

      expect(response_username).to include(last_user.first_name)
      expect(response.length).to eq(User.count)
    end
  end
end
