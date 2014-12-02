class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.references :room
      t.references :user
      t.text :content
    end
  end
end
