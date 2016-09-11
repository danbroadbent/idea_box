# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160911163434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "account_id"
    t.integer  "category_id"
  end

  add_index "ideas", ["account_id"], name: "index_ideas_on_account_id", using: :btree
  add_index "ideas", ["category_id"], name: "index_ideas_on_category_id", using: :btree

  create_table "ideas_images", id: false, force: :cascade do |t|
    t.integer  "idea_id",    null: false
    t.integer  "image_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ideas_images", ["idea_id", "image_id"], name: "index_ideas_images_on_idea_id_and_image_id", using: :btree
  add_index "ideas_images", ["image_id", "idea_id"], name: "index_ideas_images_on_image_id_and_idea_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ideas", "accounts"
  add_foreign_key "ideas", "categories"
end
