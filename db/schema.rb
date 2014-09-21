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

ActiveRecord::Schema.define(version: 20140920134733) do

  create_table "androidgames", force: true do |t|
    t.string   "title"
    t.string   "title_raw"
    t.string   "title_slug"
    t.string   "title_slug_raw"
    t.string   "dev"
    t.string   "dev_slug"
    t.string   "dev_url"
    t.string   "icon"
    t.string   "format"
    t.string   "size"
    t.string   "http"
    t.string   "bt"
    t.string   "md5_hash"
    t.integer  "bundle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "androidgames", ["bundle_id"], name: "index_androidgames_on_bundle_id"

  create_table "bundles", force: true do |t|
    t.string   "title"
    t.string   "title_raw"
    t.string   "title_slug"
    t.string   "title_slug_raw"
    t.string   "site"
    t.string   "humblebundle_trans_id"
    t.string   "paypal_trans_id"
    t.string   "indiegala_trans_id"
    t.string   "bundlestars_trans_id"
    t.string   "googlewallet_trans_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", primary_key: "steam_cat_id", force: true do |t|
    t.string "description"
  end

  create_table "categories_games", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "game_id"
  end

  create_table "drm_free_games", force: true do |t|
    t.string   "title"
    t.string   "title_raw"
    t.string   "title_slug"
    t.string   "title_slug_raw"
    t.string   "dev"
    t.string   "dev_slug"
    t.string   "dev_url"
    t.string   "format"
    t.string   "size"
    t.string   "icon"
    t.string   "http"
    t.string   "bt"
    t.string   "platform"
    t.string   "md5_hash"
    t.integer  "bundle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drm_free_games", ["bundle_id"], name: "index_drm_free_games_on_bundle_id"

  create_table "ebooks", force: true do |t|
    t.string   "title"
    t.string   "title_raw"
    t.string   "title_slug"
    t.string   "title_slug_raw"
    t.string   "dev"
    t.string   "dev_slug"
    t.string   "dev_slug_raw"
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
    t.string   "key"
    t.string   "gift_url"
    t.string   "gifted_to"
    t.string   "via"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamekeys", ["game_id"], name: "index_gamekeys_on_game_id"

  create_table "games", force: true do |t|
    t.string   "title"
    t.string   "title_raw"
    t.string   "title_slug"
    t.string   "title_slug_raw"
    t.string   "about"
    t.string   "description"
    t.string   "drm"
    t.string   "dev"
    t.string   "dev_url"
    t.string   "dev_support_url"
    t.string   "store_url"
    t.string   "app_icon"
    t.string   "header_image"
    t.string   "price"
    t.string   "pc_reqs_min"
    t.string   "pc_reqs_rec"
    t.string   "mac_reqs_min"
    t.string   "mac_reqs_rec"
    t.string   "linux_reqs_min"
    t.string   "linux_reqs_rec"
    t.string   "cheap_shark_id"
    t.string   "cheap_shark_url"
    t.boolean  "cheapshark_done"
    t.string   "steam_id"
    t.boolean  "steam_done"
    t.string   "humblebundle_trans_id"
    t.string   "paypal_trans_id"
    t.string   "indiegala_trans_id"
    t.string   "bundlestars_trans_id"
    t.string   "googlewallet_trans_id"
    t.string   "categories"
    t.string   "genres"
    t.integer  "bundle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["bundle_id"], name: "index_games_on_bundle_id"

  create_table "games_genres", id: false, force: true do |t|
    t.integer "game_id"
    t.integer "genre_id"
  end

  create_table "genres", primary_key: "steam_genre_id", force: true do |t|
    t.string "description"
  end

  create_table "giftedgamekeys", force: true do |t|
    t.integer  "game_id"
    t.string   "key"
    t.string   "gifted_to"
    t.string   "via"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "giftedgamekeys", ["game_id"], name: "index_giftedgamekeys_on_game_id"

  create_table "musictracks", force: true do |t|
    t.string   "title"
    t.string   "title_raw"
    t.string   "title_slug"
    t.string   "title_slug_raw"
    t.string   "dev"
    t.string   "dev_slug"
    t.string   "dev_url"
    t.string   "mp3dllink"
    t.string   "mp3type"
    t.string   "flacdllink"
    t.string   "flactype"
    t.string   "format"
    t.string   "size"
    t.string   "http"
    t.string   "bt"
    t.string   "md5_hash"
    t.integer  "bundle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "musictracks", ["bundle_id"], name: "index_musictracks_on_bundle_id"

end
