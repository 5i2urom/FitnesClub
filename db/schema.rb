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

ActiveRecord::Schema[7.0].define(version: 2023_01_16_204629) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: :cascade do |t|
    t.string "activity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.index ["activity"], name: "index_acts_on_activity", unique: true
    t.index ["service_id"], name: "index_acts_on_service_id"
  end

  create_table "calendar_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "club_id"
    t.bigint "coach_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "limit"
    t.index ["club_id"], name: "index_calendar_records_on_club_id"
    t.index ["coach_id"], name: "index_calendar_records_on_coach_id"
    t.index ["end_time"], name: "index_calendar_records_on_end_time"
    t.index ["limit"], name: "index_calendar_records_on_limit"
    t.index ["start_time"], name: "index_calendar_records_on_start_time"
  end

  create_table "club_acts", force: :cascade do |t|
    t.bigint "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "act_id"
    t.index ["act_id"], name: "index_club_acts_on_act_id"
    t.index ["club_id"], name: "index_club_acts_on_club_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_clubs_on_address", unique: true
    t.index ["name"], name: "index_clubs_on_name", unique: true
  end

  create_table "coaches", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "act_id"
    t.bigint "user_id"
    t.index ["act_id"], name: "index_coaches_on_act_id"
    t.index ["name"], name: "index_coaches_on_name", unique: true
    t.index ["user_id"], name: "index_coaches_on_user_id"
  end

  create_table "complaints", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "employee_id"
    t.text "message", null: false
    t.text "response"
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "theme", null: false
    t.index ["employee_id"], name: "index_complaints_on_employee_id"
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_services_on_name", unique: true
  end

  create_table "user_records", force: :cascade do |t|
    t.bigint "calendar_record_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_record_id"], name: "index_user_records_on_calendar_record_id"
    t.index ["user_id"], name: "index_user_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
