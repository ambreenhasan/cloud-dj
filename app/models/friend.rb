class Friend < ActiveRecord::Base
  belongs_to :inviter, class_name: "User", foreign_key: "user_id"
  belongs_to :invitee, class_name: "User", foreign_key: "user_id"

  validates :inviter_id, numericality: true
  validates :invitee_id, numericality: true

end