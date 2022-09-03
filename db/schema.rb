# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_03_151419) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string "entity_id"
    t.string "hotel_id"
    t.string "name"
    t.string "price"
    t.float "latitude"
    t.float "longitude"
    t.string "cheapest_partner"
    t.integer "stars"
    t.string "hero_image"
    t.string "value"
    t.string "description"
    t.boolean "booked", default: false
    t.boolean "selected", default: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_accommodations_on_trip_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "rating"
    t.string "category_name"
    t.string "price"
    t.boolean "booked"
    t.boolean "selected"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_attractions_on_trip_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companions", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "category"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_companions_on_trip_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "place_name"
    t.string "iata_code"
    t.integer "amount"
    t.string "outbound_origin_display_code"
    t.string "outbound_destination_display_code"
    t.datetime "outbound_departure", precision: nil
    t.datetime "outbound_arrival", precision: nil
    t.string "outbound_carrier_name"
    t.string "inbound_origin_display_code"
    t.string "inbound_destination_display_code"
    t.datetime "inbound_departure", precision: nil
    t.datetime "inbound_arrival", precision: nil
    t.string "inbound_carrier_name"
    t.integer "api_flight_id"
    t.boolean "booked", default: false
    t.boolean "selected", default: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_flights_on_trip_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "postal_code"
    t.integer "price_range"
    t.string "longtitude"
    t.string "latitude"
    t.string "currencies_accepted"
    t.float "rating_value"
    t.string "main_photo_src"
    t.integer "city_id"
    t.string "google_place_id"
    t.boolean "booked"
    t.boolean "selected"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_restaurants_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "origin"
    t.float "budget"
    t.float "total_cost"
    t.float "latitude"
    t.float "longitude"
    t.string "currency"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pax"
    t.string "destination"
    t.date "start_date"
    t.date "end_date"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accommodations", "trips"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attractions", "trips"
  add_foreign_key "companions", "trips"
  add_foreign_key "flights", "trips"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "restaurants", "trips"
  add_foreign_key "trips", "users"
end
