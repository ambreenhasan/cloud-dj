class CreateRoomInvites < ActiveRecord::Migration
  def change
    create_table :room_invites do |t|
      t.belongs_to :inviter, :class_name => "User"
      t.belongs_to :invitee, :class_name => "User"
      t.references :room
      t.string :accepted, default: 'false'
      t.timestamps
    end
  end
end