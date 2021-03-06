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

ActiveRecord::Schema.define(version: 20171219230901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "location"
    t.text "description"
    t.text "members", default: [], array: true
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["user_id"], name: "index_bands_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "band_id"
    t.bigint "service_id"
    t.datetime "booking_from"
    t.datetime "booking_to"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_bookings_on_band_id"
    t.index ["service_id"], name: "index_bookings_on_service_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "band_id"
    t.text "content"
    t.index ["band_id"], name: "index_reviews_on_band_id"
    t.index ["service_id"], name: "index_reviews_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 5, scale: 2
    t.datetime "available_from"
    t.datetime "available_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "category"
    t.string "tagable_type"
    t.bigint "tagable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagable_type", "tagable_id"], name: "index_tags_on_tagable_type_and_tagable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.integer "age"
    t.string "location"
    t.text "description"
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "password_salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
