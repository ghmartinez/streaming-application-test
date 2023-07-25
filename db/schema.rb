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

ActiveRecord::Schema[7.0].define(version: 2023_07_25_132311) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.string "plot"
    t.integer "episode_number"
    t.bigint "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "library_entries", force: :cascade do |t|
    t.date "expiration_date"
    t.bigint "user_id", null: false
    t.string "content_type", null: false
    t.bigint "content_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_type", "content_id"], name: "index_library_entries_on_content"
    t.index ["user_id"], name: "index_library_entries_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "plot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_options", force: :cascade do |t|
    t.decimal "price"
    t.string "video_quality"
    t.string "content_type", null: false
    t.bigint "content_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_type", "content_id"], name: "index_purchase_options_on_content"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "purchase_option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_option_id"], name: "index_purchases_on_purchase_option_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "title"
    t.string "plot"
    t.integer "season_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "episodes", "seasons"
  add_foreign_key "library_entries", "users"
  add_foreign_key "purchases", "purchase_options"
  add_foreign_key "purchases", "users"
end
