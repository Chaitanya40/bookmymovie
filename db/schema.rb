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

ActiveRecord::Schema.define(version: 2020_03_07_051033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auditoria", force: :cascade do |t|
    t.string "name"
    t.bigint "cinema_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_auditoria_on_cinema_id"
  end

  create_table "booking_items", force: :cascade do |t|
    t.bigint "booking_id"
    t.string "seat_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_items_on_booking_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "screening_id"
    t.string "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["screening_id"], name: "index_bookings_on_screening_id"
  end

  create_table "cinemas", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "locality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "language"
    t.text "info"
    t.integer "run_time_in_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screenings", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "auditorium_id"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auditorium_id"], name: "index_screenings_on_auditorium_id"
    t.index ["movie_id"], name: "index_screenings_on_movie_id"
  end

  create_table "seating_categories", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.bigint "screening_id"
    t.bigint "seating_category_id"
    t.string "seat_number"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["screening_id"], name: "index_seats_on_screening_id"
    t.index ["seating_category_id"], name: "index_seats_on_seating_category_id"
  end

end
