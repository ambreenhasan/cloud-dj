class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  has_many :user_stars
  has_many :user_votes

  validates :user_id, presence: true, numericality: true
  validates :room_id, presence: true, numericality: true
  validates :api_id, presence: true


end