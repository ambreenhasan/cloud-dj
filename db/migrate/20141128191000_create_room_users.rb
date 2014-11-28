class CreateRoomUsers < ActiveRecord::Migration
  def change
    create_table :room_users do |t|

      t.references :user
      t.references :room
    end
  end
end
