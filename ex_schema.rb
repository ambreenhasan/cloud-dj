class CreateSoundDjTables < ActiveRecord::Migration
  def change
    create_table :room_invites do |t|
      t.references :user, as: :inviter
      t.references :room
      t.references :user, as: :invitee
    end

    create_table :friends do |t|
      t.references :user
      t.references :user
    end

    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :avatar
    end

    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.references :playlist
      t.string :private
      t.references :user, as: :moderator
    end

    create_table :user_stars do |t|
      t.references :user
      t.references :song
    end

    create_table :room_users do |t|
      t.references :user
      t.references :room
    end

    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.references :user
    end

    create_table :user_votes do |t|
      t.references :user
      t.references :song
      t.references :room
    end
  end
end
