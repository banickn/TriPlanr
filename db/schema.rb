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

ActiveRecord::Schema.define(version: 20161118120142) do

  create_table "goals", force: :cascade do |t|
    t.date     "date"
    t.string   "title"
    t.text     "description"
    t.string   "priority"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "settings", force: :cascade do |t|
    t.date     "season_start"
    t.date     "season_end"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.date     "date"
    t.string   "title"
    t.string   "duration"
    t.float    "power"
    t.float    "speed"
    t.float    "distance"
    t.integer  "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_tests_on_sport_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.date     "date"
    t.string   "title"
    t.text     "description"
    t.integer  "sport_id"
    t.float    "tss"
    t.float    "duration"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sport_id"], name: "index_workouts_on_sport_id"
  end

end
