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

ActiveRecord::Schema.define(version: 20140318132428) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "api_keys", force: true do |t|
    t.string   "key"
    t.integer  "user_id"
    t.datetime "valid_until"
    t.boolean  "is_active",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["key"], name: "index_api_keys_on_key", unique: true
  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",   default: true
    t.text     "seo"
    t.text     "description"
    t.string   "slug"
  end

  add_index "categories", ["name"], name: "category_name", unique: true
  add_index "categories", ["slug"], name: "category_slug", unique: true
  add_index "categories", ["slug"], name: "index_categories_on_slug"

  create_table "categories_trips", force: true do |t|
    t.integer "trip_id"
    t.integer "category_id"
  end

  create_table "dashboards", force: true do |t|
    t.string   "name"
    t.string   "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",  default: false
    t.string   "comment"
    t.string   "pro"
    t.string   "contra"
  end

  create_table "hotels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
    t.string   "address"
    t.integer  "city_id"
    t.integer  "rating"
    t.string   "phone_number"
    t.string   "email"
    t.string   "web_page"
    t.boolean  "is_active"
    t.string   "slug"
  end

  add_index "hotels", ["name"], name: "hotel_name", unique: true
  add_index "hotels", ["slug"], name: "hotel_slug", unique: true
  add_index "hotels", ["slug"], name: "index_hotels_on_slug"
  add_index "hotels", ["trip_id"], name: "hotel_trip_id", unique: true

  create_table "mailboxes", force: true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.string   "from"
    t.integer  "mailbox_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "paintings", force: true do |t|
    t.string   "name"
    t.integer  "trip_id"
    t.boolean  "is_feature"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
    t.string   "address"
    t.string   "email"
    t.string   "phone_number"
    t.boolean  "is_active"
    t.string   "web_page"
    t.string   "slug"
  end

  add_index "restaurants", ["name"], name: "restaurant_name", unique: true
  add_index "restaurants", ["slug"], name: "index_restaurants_on_slug"
  add_index "restaurants", ["slug"], name: "restaurant_slug", unique: true
  add_index "restaurants", ["trip_id"], name: "restaurant_trip_id"

  create_table "searches", force: true do |t|
    t.string   "keyword"
    t.integer  "person_number"
    t.integer  "category_id"
    t.decimal  "min_price"
    t.decimal  "max_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "zip_code"
    t.text     "description"
    t.boolean  "is_active"
    t.string   "slug"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "is_feature",      default: false
    t.boolean  "popular"
    t.string   "country"
<<<<<<< HEAD
    t.float    "population"
=======
    t.integer  "population"
>>>>>>> a53fd873a68dd1df5fe21370be0202b96674dbd9
    t.string   "ger_name"
    t.string   "ger_city"
    t.text     "ger_description"
    t.string   "ger_country"
  end

  add_index "trips", ["latitude"], name: "trip_lat"
  add_index "trips", ["longitude"], name: "trip_lgn"
  add_index "trips", ["name"], name: "trip_name", unique: true
  add_index "trips", ["slug"], name: "index_trips_on_slug"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
