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

ActiveRecord::Schema.define(version: 2020_01_17_205936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "diagnoses", force: :cascade do |t|
    t.bigint "encounter_id", null: false
    t.text "orders"
    t.text "follow_up"
    t.string "icd"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encounter_id"], name: "index_diagnoses_on_encounter_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "provider_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "pregnancy", default: false
    t.boolean "hypertension", default: false
    t.boolean "high_bp", default: false
    t.boolean "cancer", default: false
    t.boolean "breast_lump", default: false
    t.boolean "heart_disease", default: false
    t.boolean "abnormal_ekg", default: false
    t.boolean "depression", default: false
    t.boolean "diabetes1", default: false
    t.boolean "diabetes2", default: false
    t.boolean "infertility", default: false
    t.boolean "mental_illness", default: false
    t.boolean "post_menopausal_bleeding", default: false
    t.boolean "seizures", default: false
    t.boolean "migraines", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_histories_on_user_id"
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
    t.integer "severity"
    t.index ["encounter_id"], name: "index_hpis_on_encounter_id"
  end

  create_table "intakes", force: :cascade do |t|
    t.bigint "encounter_id", null: false
    t.text "complaint"
    t.datetime "appointment_at"
    t.datetime "checkin_at"
    t.integer "weight"
    t.integer "height"
    t.integer "bp_systolic"
    t.integer "bp_diastolic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encounter_id"], name: "index_intakes_on_encounter_id"
  end

  create_table "problem_exams", force: :cascade do |t|
    t.bigint "encounter_id", null: false
    t.integer "appearance"
    t.string "constitutional_details"
    t.integer "psychiatric_state"
    t.string "psychiatric_details"
    t.boolean "abdominal_tenderness", default: false
    t.string "abdominal_details"
    t.boolean "mass_detected", default: false
    t.string "mass_details"
    t.integer "bowel_sounds"
    t.integer "pelvic_external"
    t.integer "pelvic_vaginal"
    t.integer "pelvic_uteris"
    t.integer "pelvic_ovaries"
    t.integer "pelvic_bladder"
    t.string "pelvic_details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encounter_id"], name: "index_problem_exams_on_encounter_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.integer "state"
    t.string "zip"
    t.string "photo"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "rosystems", force: :cascade do |t|
    t.bigint "encounter_id", null: false
    t.boolean "fever", default: false
    t.boolean "fatigue", default: false
    t.boolean "appetite", default: false
    t.boolean "weight", default: false
    t.string "constitutional_details"
    t.boolean "depression", default: false
    t.boolean "anxiety", default: false
    t.string "psychiatric_details"
    t.boolean "trouble_swallowing", default: false
    t.boolean "heartburn", default: false
    t.boolean "nausea", default: false
    t.boolean "vomiting", default: false
    t.boolean "irregular_bm", default: false
    t.string "gastrointestinal_details"
    t.boolean "trouble_urinating", default: false
    t.boolean "abnormal_bleeding", default: false
    t.boolean "vaginal_discharge", default: false
    t.string "genital_urinary_description"
    t.boolean "joint_pain", default: false
    t.boolean "joint_swelling", default: false
    t.string "musculoskeletal_details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encounter_id"], name: "index_rosystems_on_encounter_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "diagnoses", "encounters"
  add_foreign_key "histories", "users"
  add_foreign_key "hpis", "encounters"
  add_foreign_key "intakes", "encounters"
  add_foreign_key "problem_exams", "encounters"
  add_foreign_key "profiles", "users"
  add_foreign_key "rosystems", "encounters"
end
