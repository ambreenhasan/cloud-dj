class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :inviter, :class_name => "User"
      t.references :invitee, :class_name => "User"
      t.string :accepted, default: 'false'

      t.timestamps

    end
  end
end
