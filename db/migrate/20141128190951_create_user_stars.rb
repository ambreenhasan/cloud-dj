class CreateUserStars < ActiveRecord::Migration
  def change
    create_table :user_stars do |t|
      t.references :user
      t.references :song

      t.timestamps
    end
  end
end
