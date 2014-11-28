class User < ActiveRecord::Base
  has_many :friends
  has_many :rooms
  has_many :user_stars
  has_many :user_votes
end
