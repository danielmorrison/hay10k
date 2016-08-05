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

ActiveRecord::Schema.define(version: 20140802031448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "age_groups", force: :cascade do |t|
    t.integer  "low"
    t.integer  "high"
    t.integer  "gender_id"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finishes", force: :cascade do |t|
    t.integer  "place"
    t.string   "time",       limit: 510
    t.integer  "person_id"
    t.integer  "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name", limit: 510
  end

  create_table "geocodes", force: :cascade do |t|
    t.decimal "latitude",                precision: 15, scale: 12
    t.decimal "longitude",               precision: 15, scale: 12
    t.string  "query",       limit: 510
    t.string  "street",      limit: 510
    t.string  "locality",    limit: 510
    t.string  "region",      limit: 510
    t.string  "postal_code", limit: 510
    t.string  "country",     limit: 510
  end

  add_index "geocodes", ["query"], name: "geocodes_query_key", unique: true, using: :btree

  create_table "geocodings", force: :cascade do |t|
    t.integer "geocodable_id"
    t.integer "geocode_id"
    t.string  "geocodable_type", limit: 510
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name", limit: 510
    t.string   "last_name",  limit: 510
    t.integer  "age"
    t.integer  "gender_id"
    t.string   "street",     limit: 510
    t.string   "city",       limit: 510
    t.string   "state",      limit: 510
    t.string   "zip",        limit: 510
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", force: :cascade do |t|
    t.string  "name",     limit: 510
    t.integer "distance"
    t.integer "year_id"
    t.date    "date"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "race_id"
    t.integer  "year_id"
    t.integer  "lock_version", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "years", force: :cascade do |t|
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
