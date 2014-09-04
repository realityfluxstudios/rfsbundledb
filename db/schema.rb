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

ActiveRecord::Schema.define(version: 20140823122535) do

  create_table "androidgames", force: true do |t|
    t.integer  "bundle_id"
    t.string   "title"
    t.string   "dllink"
    t.string   "title_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "androidgames", ["bundle_id"], name: "index_androidgames_on_bundle_id"

  create_table "bundles", force: true do |t|
    t.string   "name"
    t.string   "site"
    t.string   "gift_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_slug"
  end

  create_table "drmfreegames", force: true do |t|
    t.integer  "bundle_id"
    t.string   "title"
    t.string   "title_slug"
    t.string   "dllink"
    t.string   "platform"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drmfreegames", ["bundle_id"], name: "index_drmfreegames_on_bundle_id"

  create_table "ebooks", force: true do |t|
    t.string   "title"
    t.string   "title_slug"
    t.string   "dev"
    t.string   "dev_slug"
    t.string   "size"
    t.string   "format"
    t.string   "http"
    t.string   "bt"
    t.string   "md5_hash"
    t.integer  "bundle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ebooks", ["bundle_id"], name: "index_ebooks_on_bundle_id"

  create_table "gamekeys", force: true do |t|
    t.integer  "game_id"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamekeys", ["game_id"], name: "index_gamekeys_on_game_id"

  create_table "games", force: true do |t|
    t.integer  "bundle_id"
    t.string   "title"
    t.string   "drm"
    t.string   "title_slug"
    t.string   "store_url"
    t.string   "image_url"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["bundle_id"], name: "index_games_on_bundle_id"

  create_table "giftedgamekeys", force: true do |t|
    t.integer  "game_id"
    t.text     "key"
    t.text     "gifted_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musictracks", force: true do |t|
    t.integer  "bundle_id"
    t.string   "title"
    t.string   "artist"
    t.string   "mp3dllink"
    t.string   "flacdllink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title_slug"
  end

  add_index "musictracks", ["bundle_id"], name: "index_musictracks_on_bundle_id"

end
