class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :user, as: :inviter
      t.references :user, as: :invitee

      t.timestamps

    end
  end
end
