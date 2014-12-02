require 'bcrypt'
class User < ActiveRecord::Base
  has_many :friends
  has_many :rooms
  has_many :room_invites
  has_many :user_stars
  has_many :user_votes

  validates :first_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password, presence: true

  def invites_extended
    RoomInvite.where(inviter_id: self.id, accepted: 'false')
  end

  def invites_received
    RoomInvite.where(invitee_id: self.id, accepted: 'false')
  end

  def friendships
    self.freinds.where(accepted: "true")
  end

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
