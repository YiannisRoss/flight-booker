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

ActiveRecord::Schema.define(version: 2021_08_26_090126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "outbound_flight_id"
    t.integer "inbound_flight_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "flight_id"
    t.integer "passenger_id"
  end

  create_table "flights", force: :cascade do |t|
    t.date "flight_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "departure_airport_id"
    t.bigint "destination_airport_id"
    t.string "airline"
    t.string "departure_time"
    t.string "arrival_time"
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_flights_on_booking_id"
    t.index ["departure_airport_id"], name: "index_flights_on_departure_airport_id"
    t.index ["destination_airport_id"], name: "index_flights_on_destination_airport_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

  add_foreign_key "airports", "flights", column: "inbound_flight_id"
  add_foreign_key "airports", "flights", column: "outbound_flight_id"
  add_foreign_key "flights", "airports", column: "departure_airport_id"
  add_foreign_key "flights", "airports", column: "destination_airport_id"
  add_foreign_key "flights", "bookings"
  add_foreign_key "passengers", "bookings"
end
