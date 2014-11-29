class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.string :status
      t.belongs_to :moderator, :class_name => 'User'

      t.timestamps
    end
  end
end
