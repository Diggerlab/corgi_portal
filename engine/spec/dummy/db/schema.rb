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

ActiveRecord::Schema.define(version: 20140516041412) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                default: 1
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "corgi_accounts", force: true do |t|
    t.integer  "vcs"
    t.integer  "coins"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "corgi_accounts", ["user_id"], name: "index_corgi_accounts_on_user_id", using: :btree

  create_table "corgi_authentications", force: true do |t|
    t.string   "provider"
    t.string   "token"
    t.string   "token_secret"
    t.string   "openid"
    t.string   "openkey"
    t.string   "refresh_token"
    t.datetime "expired_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
  end

  add_index "corgi_authentications", ["user_id"], name: "index_corgi_authentications_on_user_id", using: :btree

  create_table "corgi_build_versions", force: true do |t|
    t.integer  "base_build"
    t.integer  "latest_build"
    t.string   "publisher"
    t.string   "latest_version"
    t.text     "latest_description"
    t.string   "latest_url"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "corgi_feedbacks", force: true do |t|
    t.string   "contact"
    t.string   "content",         limit: 4000
    t.string   "ip"
    t.integer  "responses_count",              default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "corgi_feedbacks", ["user_id"], name: "index_corgi_feedbacks_on_user_id", using: :btree

  create_table "corgi_friends", force: true do |t|
    t.string   "provider"
    t.integer  "friend_user_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "friend_uid"
    t.integer  "authentication_id"
    t.integer  "friend_authentication_id"
    t.string   "state"
  end

  add_index "corgi_friends", ["user_id"], name: "index_corgi_friends_on_user_id", using: :btree

  create_table "corgi_notice_translations", force: true do |t|
    t.integer  "corgi_notice_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "content"
  end

  add_index "corgi_notice_translations", ["corgi_notice_id"], name: "index_corgi_notice_translations_on_corgi_notice_id", using: :btree
  add_index "corgi_notice_translations", ["locale"], name: "index_corgi_notice_translations_on_locale", using: :btree

  create_table "corgi_notices", force: true do |t|
    t.integer  "admin_user_id"
    t.string   "title"
    t.boolean  "enabled"
    t.text     "content"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "corgi_notices", ["admin_user_id"], name: "index_corgi_notices_on_admin_user_id", using: :btree

  create_table "corgi_password_requests", force: true do |t|
    t.string   "ip"
    t.string   "email"
    t.string   "token"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "corgi_password_requests", ["user_id"], name: "index_corgi_password_requests_on_user_id", using: :btree

  create_table "corgi_products", force: true do |t|
    t.string   "sk_product_id"
    t.boolean  "enabled"
    t.integer  "vcs_got"
    t.float    "gross"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "corgi_recharges", force: true do |t|
    t.string   "state"
    t.integer  "vcs"
    t.integer  "iap_quantity"
    t.string   "iap_product_id"
    t.string   "iap_transaction_id"
    t.datetime "iap_purchase_date"
    t.string   "iap_original_transaction_id"
    t.datetime "iap_original_purchase_date"
    t.string   "iap_app_item_id"
    t.string   "iap_version_external_identifier"
    t.string   "iap_bid"
    t.string   "iap_bvrs"
    t.text     "receipt_data"
    t.string   "checksum"
    t.datetime "verified_at"
    t.text     "verified_log"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "corgi_recharges", ["product_id"], name: "index_corgi_recharges_on_product_id", using: :btree
  add_index "corgi_recharges", ["user_id"], name: "index_corgi_recharges_on_user_id", using: :btree

  create_table "corgi_responses", force: true do |t|
    t.string   "contact"
    t.string   "content",     limit: 4000
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feedback_id"
    t.integer  "user_id"
  end

  add_index "corgi_responses", ["feedback_id"], name: "index_corgi_responses_on_feedback_id", using: :btree
  add_index "corgi_responses", ["user_id"], name: "index_corgi_responses_on_user_id", using: :btree

  create_table "corgi_user_codes", force: true do |t|
    t.string  "code"
    t.integer "user_id"
  end

  add_index "corgi_user_codes", ["user_id"], name: "index_corgi_user_codes_on_user_id", using: :btree

  create_table "corgi_users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "state"
    t.string   "authentication_token"
    t.string   "role"
    t.time     "authentication_token_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
