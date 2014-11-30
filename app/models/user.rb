require 'bcrypt'
class User < ActiveRecord::Base
  has_many :friends
  has_many :rooms
  has_many :user_stars
  has_many :user_votes

  validates :first_name, presence: true
  validates :last_name, presence:true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
