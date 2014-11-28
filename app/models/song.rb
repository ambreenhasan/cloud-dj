class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  has_many :user_stars
  has_many :user_votes
end