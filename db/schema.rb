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

ActiveRecord::Schema.define(version: 20150727012811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movie_types", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_types_movies", id: false, force: :cascade do |t|
    t.integer "movie_id",      null: false
    t.integer "movie_type_id", null: false
  end

  add_index "movie_types_movies", ["movie_id", "movie_type_id"], name: "index_movie_types_movies_on_movie_id_and_movie_type_id", using: :btree
  add_index "movie_types_movies", ["movie_type_id", "movie_id"], name: "index_movie_types_movies_on_movie_type_id_and_movie_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "tmdb_num"
    t.string   "tmdb_poster"
    t.string   "youtube_num"
    t.integer  "runtime"
    t.date     "date_from"
    t.date     "date_to"
    t.boolean  "is_confirmed"
    t.boolean  "is_canceled"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "payment_type"
    t.boolean  "is_canceled"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.string   "type"
    t.float    "price"
    t.date     "date_from"
    t.date     "date_to"
    t.boolean  "is_confirmed"
    t.boolean  "is_available"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "seats", force: :cascade do |t|
    t.string   "num"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "ticket_id"
    t.integer  "show_time_id"
  end

  add_index "seats", ["show_time_id"], name: "index_seats_on_show_time_id", using: :btree
  add_index "seats", ["ticket_id"], name: "index_seats_on_ticket_id", using: :btree

  create_table "show_times", force: :cascade do |t|
    t.datetime "time_at"
    t.boolean  "is_confirmed"
    t.boolean  "is_canceled"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "movie_id"
    t.integer  "theater_id"
  end

  add_index "show_times", ["movie_id"], name: "index_show_times_on_movie_id", using: :btree
  add_index "show_times", ["theater_id"], name: "index_show_times_on_theater_id", using: :btree

  create_table "theater_types", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theater_types_theaters", id: false, force: :cascade do |t|
    t.integer "theater_id",      null: false
    t.integer "theater_type_id", null: false
  end

  add_index "theater_types_theaters", ["theater_id", "theater_type_id"], name: "index_theater_types_theaters_on_theater_id_and_theater_type_id", using: :btree
  add_index "theater_types_theaters", ["theater_type_id", "theater_id"], name: "index_theater_types_theaters_on_theater_type_id_and_theater_id", using: :btree

  create_table "theaters", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_available"
    t.integer  "num_of_seats"
    t.text     "seats_array"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.boolean  "is_canceled"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order_id"
    t.integer  "seat_id"
    t.integer  "price_id"
  end

  add_index "tickets", ["order_id"], name: "index_tickets_on_order_id", using: :btree
  add_index "tickets", ["price_id"], name: "index_tickets_on_price_id", using: :btree
  add_index "tickets", ["seat_id"], name: "index_tickets_on_seat_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_number"
    t.float    "credit"
    t.integer  "access_level"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "orders", "users"
  add_foreign_key "seats", "show_times"
  add_foreign_key "seats", "tickets"
  add_foreign_key "show_times", "movies"
  add_foreign_key "show_times", "theaters"
  add_foreign_key "tickets", "orders"
  add_foreign_key "tickets", "prices"
  add_foreign_key "tickets", "seats"
end
