require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  before(:each) do
    User.destroy_all
    @user = User.create(email: 'michael@michael.com', first_name: 'michael', last_name: 'teevan', password: 'password')
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

  describe "POST users#create" do
    it "creates a user if passed valid parameters" do
      post :create, format: :json, user: {
        email: 'create@me.com',
        first_name: 'pleazzz',
        last_name: 'createme',
        password: 'banana'
        }
      expect(User.last.first_name).to eq('pleazzz')
    end
  end

  describe "GET users#new" do
    it "should return a success status" do
      get :new
      expect(response.status).to eq(200)
      #currently failing because of missing template
    end
  end

  describe "GET users#edit" do
    it "should return a success status" do
      get :edit, :id => @user.id
      expect(response.status).to eq(200)
      #currently failing because of missing template
    end

    it "assigns user to @user" do
      get :edit, :id => @user.id
      expect(assigns(:user)).to eq(user)
      #currently failing because of missing template
    end
  end

  describe "GET users#show" do
    it "should return a success status" do
      get :show, :id => @user.id
      expect(response.status).to eq(200)
      #currently failing because of missing template
    end

    it "assigns user to @user" do
      get :show, :id => @user.id
      expect(assigns(:user)).to eq(user)
      #currently failing because of missing template
    end
  end

  describe "PUT users#update" do
    it "" do

    end
  end

  describe "DELETE users#destroy" do
    it "" do

    end
  end
end