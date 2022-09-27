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

ActiveRecord::Schema[7.0].define(version: 2022_09_27_143950) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dance_classes", force: :cascade do |t|
    t.string "genre"
    t.string "level"
    t.integer "weekday"
    t.time "start_time"
    t.time "end_time"
    t.string "instructor"
    t.integer "price"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "studio_id", null: false
    t.bigint "genre_id", null: false
    t.index ["genre_id"], name: "index_dance_classes_on_genre_id"
    t.index ["studio_id"], name: "index_dance_classes_on_studio_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "city"
    t.string "address"
    t.string "url"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dance_classes", "genres"
  add_foreign_key "dance_classes", "studios"
end
