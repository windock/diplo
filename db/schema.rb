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

ActiveRecord::Schema.define(version: 20160328195959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "username"
    t.integer  "device_type"
    t.integer  "lifecycle"
    t.boolean  "email_enabled"
    t.boolean  "printer_enabled"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "profile_id"
  end

  add_index "devices", ["profile_id"], name: "index_devices_on_profile_id", using: :btree

  create_table "markets", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_markets", force: :cascade do |t|
    t.integer  "market_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_translations", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "title"
    t.text     "description"
    t.integer  "language"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "product_translations", ["product_id"], name: "index_product_translations_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.integer  "primary_concern"
    t.integer  "skin_type"
    t.string   "sku"
    t.decimal  "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "profile_markets", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "market_id"
  end

  add_index "profile_markets", ["market_id"], name: "index_profile_markets_on_market_id", using: :btree
  add_index "profile_markets", ["profile_id"], name: "index_profile_markets_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "welcome_button1"
    t.integer  "welcome_button2"
    t.integer  "welcome_button3"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "related_product_relations", force: :cascade do |t|
    t.integer "product_id"
    t.integer "related_product_id"
  end

  add_index "related_product_relations", ["product_id", "related_product_id"], name: "product_uniqueness", unique: true, using: :btree
  add_index "related_product_relations", ["product_id"], name: "index_related_product_relations_on_product_id", using: :btree

  add_foreign_key "devices", "profiles"
  add_foreign_key "product_translations", "products"
  add_foreign_key "profile_markets", "markets"
  add_foreign_key "profile_markets", "profiles"
end
