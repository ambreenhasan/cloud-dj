class Room < ActiveRecord::Base
  has_one :user
  has_many :users, through: :room_users
  has_many :user_votes
  has_many :songs
  has_many :chats

  validates :name, presence: true
  validates :description, presence: true
end
