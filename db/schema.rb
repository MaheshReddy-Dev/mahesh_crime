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

ActiveRecord::Schema[7.0].define(version: 2023_03_07_053649) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crime_reporters", force: :cascade do |t|
    t.string "reporter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "email"
  end

  create_table "crimes", force: :cascade do |t|
    t.text "description"
    t.string "crime_type"
    t.bigint "locality_id", null: false
    t.bigint "crime_reporter_id", null: false
    t.integer "priority", default: 0
    t.boolean "resolved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crime_reporter_id"], name: "index_crimes_on_crime_reporter_id"
    t.index ["locality_id"], name: "index_crimes_on_locality_id"
  end

  create_table "localities", force: :cascade do |t|
    t.string "locality"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_localities_on_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "crimes", "crime_reporters"
  add_foreign_key "crimes", "localities"
  add_foreign_key "localities", "cities"
end
