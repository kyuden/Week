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

ActiveRecord::Schema.define(:version => 20130827220310) do

  create_table "articles", :force => true do |t|
    t.text     "title",                           :null => false
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
    t.string   "place_adress"
    t.string   "place_name"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  add_index "articles", ["id", "user_id"], :name => "index_articles_on_id_and_user_id"
  add_index "articles", ["title", "disp_day"], :name => "index_articles_on_title_and_disp_day", :length => {"title"=>255, "disp_day"=>nil}
  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "entry_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "body",       :null => false
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "adress"
    t.string   "category"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "watch_id"
  end

  add_index "entries", ["article_id", "watch_id"], :name => "index_entries_on_article_id_and_watch_id"
  add_index "entries", ["article_id"], :name => "index_entries_on_article_id"
  add_index "entries", ["watch_id"], :name => "index_entries_on_watch_id"

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

  add_index "users", ["location", "age"], :name => "index_users_on_location_and_age"

  create_table "watches", :force => true do |t|
    t.integer  "user_id"
    t.integer  "entry_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
