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

ActiveRecord::Schema.define(version: 20150530103503) do

  create_table "food_donors", force: :cascade do |t|
    t.boolean  "has_transport"
    t.string   "available_till"
    t.integer  "sufficient_for"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "food_responces", force: :cascade do |t|
    t.integer  "ngo_id"
    t.integer  "food_donor_id"
    t.string   "status"
    t.boolean  "has_transport"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "food_responces", ["food_donor_id"], name: "index_food_responces_on_food_donor_id"
  add_index "food_responces", ["ngo_id"], name: "index_food_responces_on_ngo_id"

  create_table "list_items", force: :cascade do |t|
    t.string   "name"
    t.string   "quantity"
    t.integer  "food_donor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "list_items", ["food_donor_id"], name: "index_list_items_on_food_donor_id"

  create_table "ngos", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "lat"
    t.string   "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifiers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "ngo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notifiers", ["ngo_id"], name: "index_notifiers_on_ngo_id"

  create_table "regions", force: :cascade do |t|
    t.string   "address"
    t.string   "lat"
    t.string   "long"
    t.string   "region_for"
    t.integer  "region_for_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "transporters", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
