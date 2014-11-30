class UserVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  belongs_to :room

  validates :user_id, presence: true, numericality: true
  validates :song_id, presence: true, numericality: true
  validates :room_id, presence: true, numericality: true
end