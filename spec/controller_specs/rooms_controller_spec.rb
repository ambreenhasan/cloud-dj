require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do
  before :each do
    Room.destroy_all
  end

  describe 'GET room#index' do
    it 'gives a successful response' do
      get :index
      p "HELLO!!!!!"
      expect(response.status).to eq(200)
    end

    it 'assigns @rooms to Room.all' do
      get :index
      expect(assigns(:rooms)).to eq Room.all
    end
  end

  before :each do
    Room.destroy_all
    User.destroy_all
    @user = User.create(email:'a@a.a',first_name:'aa',last_name:'aaa',password_hash:'a')
    @valid_params = {name:'aRoom', description:'aDesc', status:'public'}
  end

  describe 'POST rooms#create' do
    it 'creates a new room' do
      p @user.id
      p @valid_params
      expect{post :create, :user_id => @user.id, :room => @valid_params}.to change{Room.count}.by 1
    end
  end
end