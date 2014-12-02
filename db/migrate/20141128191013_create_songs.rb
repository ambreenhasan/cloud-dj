class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :user
      t.string :api_id
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
