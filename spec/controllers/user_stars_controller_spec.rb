require 'rails_helper'

RSpec.describe UserStarsController, :type => :controller do
  before(:each) do
    User.destroy_all
    @mike = User.create(email: 'michael@michael.com', first_name: 'michael', last_name: 'teevan', password: 'password')
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
end