class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.belongs_to :inviter, :class_name => "User"
      t.belongs_to :invitee, :class_name => "User"
      t.string :accepted, default: 'false'

      t.timestamps

    end
  end
end
