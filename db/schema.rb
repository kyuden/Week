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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130602073956) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.integer  "comment_id"
    t.integer  "user_id"
    t.integer  "entry_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "publish",      :default => false
    t.string   "disp_day"
    t.string   "about_time"
    t.string   "place_adress", default: "平和祈念像"
    t.string   "place_name"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "entry_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "watch_id"
  end

  create_table "users", :force => true do |t|
    t.string   "uid",          :null => false
    t.string   "access_token"
    t.string   "name",         :null => false
    t.string   "email"
    t.string   "gender"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "location"
    t.integer  "age"
  end

  create_table "watches", :force => true do |t|
    t.integer  "user_id"
    t.integer  "entry_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
