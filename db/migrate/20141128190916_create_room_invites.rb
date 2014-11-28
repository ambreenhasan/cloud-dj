class CreateRoomInvites < ActiveRecord::Migration
  def change
    create_table :room_invites do |t|
      t.references :user, as: :inviter
      t.references :room
      t.references :user, as: :invitee

      t.timestamps
    end
  end
end
