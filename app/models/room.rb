class Room < ActiveRecord::Base
  has_many :users
  has_one :moderator, class_name: "User", foreign_key: "user_id"
end