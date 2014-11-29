class Room < ActiveRecord::Base
  has_one :user
  has_many :users, through: :room_users

  validates :name, presence: true
  validates :description, presence: true
end