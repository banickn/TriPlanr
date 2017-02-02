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

ActiveRecord::Schema.define(version: 20161123144919) do

  create_table "goals", force: :cascade do |t|
    t.date     "date"
    t.string   "title"
    t.text     "description"
    t.string   "priority"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "periodization_cycles", force: :cascade do |t|
    t.string   "title"
    t.string   "kind"
    t.float    "goal_ctl_bike"
    t.float    "goal_ctl_run"
    t.float    "goal_ctl_swim"
    t.integer  "year_position"
    t.integer  "periodization_year_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["periodization_year_id"], name: "index_periodization_cycles_on_periodization_year_id"
  end

  create_table "periodization_weeks", force: :cascade do |t|
    t.string   "title"
    t.string   "kind"
    t.date     "date"
    t.float    "goal_ctl_bike"
    t.float    "goal_ctl_run"
    t.float    "goal_ctl_swim"
    t.integer  "cycle_position"
    t.integer  "periodization_cycle_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["periodization_cycle_id"], name: "index_periodization_weeks_on_periodization_cycle_id"
  end

  create_table "periodization_years", force: :cascade do |t|
    t.string   "title"
    t.date     "season_start"
    t.date     "season_end"
    t.integer  "start_ctl_bike"
    t.integer  "start_ctl_run"
    t.integer  "start_ctl_swim"
    t.integer  "goal_ctl_bike"
    t.integer  "goal_ctl_run"
    t.integer  "goal_ctl_swim"
    t.integer  "block_ratio"
    t.integer  "duration_base"
    t.integer  "duration_build"
    t.integer  "duration_taper"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer  "weight"
    t.integer  "ftp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.date     "date"
    t.string   "title"
    t.float    "duration"
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
    t.boolean  "finished",    default: false
    t.float    "distance"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["sport_id"], name: "index_workouts_on_sport_id"
  end

end
