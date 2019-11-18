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

ActiveRecord::Schema.define(version: 2019_11_18_141309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_tests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "card_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_tests_on_card_id"
    t.index ["user_id"], name: "index_card_tests_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "term"
    t.text "definition"
    t.string "context"
    t.string "photo"
    t.date "date_last_test"
    t.integer "number_of_test"
    t.integer "vitality"
    t.string "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "decks", force: :cascade do |t|
    t.integer "vitality"
    t.integer "rank"
    t.string "name"
    t.string "description"
    t.bigint "theme_id", null: false
    t.integer "stars"
    t.boolean "is_private"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theme_id"], name: "index_decks_on_theme_id"
  end

  create_table "themes", force: :cascade do |t|
    t.integer "vitality"
    t.string "name"
    t.boolean "is_public"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_themes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "team"
    t.string "type"
    t.string "avatar"
    t.date "birthday"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "card_tests", "cards"
  add_foreign_key "card_tests", "users"
  add_foreign_key "decks", "themes"
  add_foreign_key "themes", "users"
end
