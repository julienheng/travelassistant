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

ActiveRecord::Schema[7.0].define(version: 2022_09_01_070552) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string "entity_id"
    t.string "hotel_id"
    t.string "name"
    t.string "price"
    t.float "coordinates"
    t.string "cheapest_partner"
    t.integer "stars"
    t.string "hero_image"
    t.string "value"
    t.string "description"
    t.boolean "booked"
    t.boolean "selected"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_accommodations_on_trip_id"
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
    t.string "type"
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
    t.datetime "inbound_depature", precision: nil
    t.datetime "inbound_arrival", precision: nil
    t.string "inbound_carrier_name"
    t.integer "api_flight_id"
    t.boolean "booked"
    t.boolean "selected"
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

  create_table "trips", force: :cascade do |t|
    t.integer "start_date"
    t.integer "end_date"
    t.string "location"
    t.float "budget"
    t.float "total_cost"
    t.float "latitude"
    t.float "longitude"
    t.string "currency"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  add_foreign_key "companions", "trips"
  add_foreign_key "flights", "trips"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "trips", "users"
end
