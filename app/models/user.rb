require 'bcrypt'
class User < ActiveRecord::Base
  has_many :friends
  has_many :rooms
  has_many :room_invites
  has_many :user_stars
  has_many :user_votes


  def invites_extended
    RoomInvite.where(inviter_id: self.id, accepted: 'false')
  end

  def invites_received
    RoomInvite.where(invitee_id: self.id, accepted: 'false')
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
