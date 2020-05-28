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

ActiveRecord::Schema.define(version: 2020_05_28_153714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "own_content_id"
    t.bigint "third_party_content_id"
    t.index ["own_content_id"], name: "index_comments_on_own_content_id"
    t.index ["third_party_content_id"], name: "index_comments_on_third_party_content_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "third_party_content_id"
    t.bigint "own_content_id"
    t.index ["own_content_id"], name: "index_favourites_on_own_content_id"
    t.index ["third_party_content_id"], name: "index_favourites_on_third_party_content_id"
  end

  create_table "own_contents", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "article"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "published_date"
  end

  create_table "third_party_contents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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

  add_foreign_key "comments", "own_contents"
  add_foreign_key "comments", "third_party_contents"
  add_foreign_key "favourites", "own_contents"
  add_foreign_key "favourites", "third_party_contents"
end
