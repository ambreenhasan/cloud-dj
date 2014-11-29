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
    it "finds the user and updates if valid params" do
      @new_attr = {first_name: "michaelmichael"}
      put :update, :id => @user.id, :user => @new_attr
      @user.reload
      expect(@user.first_name).to eq("michaelmichael")
      expect(@user.last_name).to eq("teevan")
      expect(response).to be_redirect
    end

    it "does not update if invalid params" do
      @new_attr = {first_name: "", not_a_valid_attr: "hi there"}
      put :update, :id => @user.id, :user => @new_attr
      @user.reload
      expect(@user.first_name).to eq("michael")
      expect(@user.last_name).to eq("teevan")
    end
  end

  describe "DELETE users#destroy" do
    it "deletes a user" do
      expect {
      delete :destroy, id: @user.id
      }.to change {User.count}.by(-1)
    end

    it "redirects to the user index" do
      delete :destroy, id: @user.id
      expect(response).to be_redirect
    end
  end
end