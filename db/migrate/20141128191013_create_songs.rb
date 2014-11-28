class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :user
      t.references :room
      t.string :api_id

      t.timestamps
    end
  end
end
