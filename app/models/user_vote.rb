class UserVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  belongs_to :room

  # validates :user, presence: true, numericality: true
  # validates :song, presence: true, numericality: true
  # validates :room, presence: true, numericality: true
end