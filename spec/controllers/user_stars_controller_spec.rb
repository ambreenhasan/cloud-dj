require 'rails_helper'

RSpec.describe UserStarsController, :type => :controller do
  before(:each) do
    User.destroy_all
    @mike = User.create(email: 'michael@michael.com', first_name: 'michael', last_name: 'teevan', password: 'password')
    @song = Song.create(user_id: @mike.id, room_id: 1, api_id: "1")
    10.times do
      UserStar.create(user_id: @mike.id, song_id: rand(1..20))
    end
  end

  describe "GET user_stars#index" do
    it "returns all of current user's starred songs" do
      get :index, :user_id => @mike.id
      last_response = JSON.parse(response.body)
      response_id = last_response.map { |starred| starred["user_id"] }
      user_stars = @mike.user_stars

      user_stars.each do |user_star|
        expect(response_id).to include(user_star.user_id)
      end

      expect(last_response.count).to eq(user_stars.count)
    end
  end

  describe "POST user_stars#create" do
    it "creates a starred song for user" do
      expect{ post :create, :user_id => @mike.id, format: :json, user_star: {
        user_id: @mike.id,
        song_id: @song.id
      }}.to change{ @mike.user_stars.count }.by 1
    end
  end
end