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

ActiveRecord::Schema.define(version: 20140528103123) do

  create_table "app_services", force: true do |t|
    t.integer  "app_id"
    t.integer  "service_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apps", force: true do |t|
    t.string   "name"
    t.string   "www"
    t.string   "category"
    t.string   "platform"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apps", ["user_id"], name: "index_apps_on_user_id", using: :btree

  create_table "service_functions", force: true do |t|
    t.string  "title"
    t.string  "api"
    t.integer "service_id"
    t.string  "instruction"
  end

  create_table "services", force: true do |t|
    t.string "code"
    t.string "title"
    t.string "state"
    t.string "description"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "re_password"
    t.string   "company"
    t.string   "contact_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
