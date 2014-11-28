class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.string :private
      t.references :user, as: :moderator

      t.timestamps
    end
  end
end
