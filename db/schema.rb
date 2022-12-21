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

ActiveRecord::Schema[7.0].define(version: 2022_12_21_221627) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendar_records", force: :cascade do |t|
    t.date "date_start"
    t.date "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_act_id"
    t.bigint "club_id"
    t.bigint "coach_id"
    t.index ["club_id"], name: "index_calendar_records_on_club_id"
    t.index ["coach_id"], name: "index_calendar_records_on_coach_id"
    t.index ["service_act_id"], name: "index_calendar_records_on_service_act_id"
  end

  create_table "club_acts", force: :cascade do |t|
    t.bigint "club_id", null: false
    t.bigint "service_act_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_acts_on_club_id"
    t.index ["service_act_id"], name: "index_club_acts_on_service_act_id"
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
    t.bigint "service_act_id"
    t.index ["name"], name: "index_coaches_on_name", unique: true
    t.index ["service_act_id"], name: "index_coaches_on_service_act_id"
  end

  create_table "service_acts", force: :cascade do |t|
    t.string "service", null: false
    t.string "activity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
