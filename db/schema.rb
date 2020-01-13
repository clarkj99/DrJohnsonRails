# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_13_152347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "encounters", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "provider_id"
    t.text "complaint"
    t.boolean "closed", default: false
    t.datetime "appointment_at"
    t.datetime "checkin_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "weight"
    t.integer "height"
    t.integer "bp_systolic"
    t.integer "bp_diastolic"
  end

  create_table "hpis", force: :cascade do |t|
    t.bigint "encounter_id", null: false
    t.integer "duration"
    t.integer "duration_units"
    t.string "location"
    t.string "context"
    t.integer "aggravating_factors"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encounter_id"], name: "index_hpis_on_encounter_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.integer "state"
    t.string "zip"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.integer "role", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "hpis", "encounters"
  add_foreign_key "profiles", "users"
end
