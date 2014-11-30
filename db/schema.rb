# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141128224437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_invites", force: true do |t|
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.integer  "room_id"
    t.string   "accepted",   default: "false"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.string   "description"
<<<<<<< HEAD
    t.string   "publicness"
    t.integer  "user_id"
=======
    t.string   "status"
    t.integer  "moderator_id"
>>>>>>> room-invites-controller
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.string   "api_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_stars", force: true do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
