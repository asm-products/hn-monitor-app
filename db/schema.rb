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

ActiveRecord::Schema.define(version: 20150130192608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_monitors", force: true do |t|
    t.integer "hn_id"
  end

  add_index "api_monitors", ["hn_id"], name: "index_api_monitors_on_hn_id", using: :btree

  create_table "stories", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hn_id"
    t.string   "hn_user"
  end

  create_table "story_triggers", force: true do |t|
    t.integer  "story_id"
    t.integer  "trigger_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "triggers", force: true do |t|
    t.string "trigger_type"
    t.string "word"
  end

  create_table "user_triggers", force: true do |t|
    t.integer "user_id"
    t.integer "trigger_id"
  end

  add_index "user_triggers", ["trigger_id", "user_id"], name: "index_user_triggers_on_trigger_id_and_user_id", using: :btree
  add_index "user_triggers", ["user_id", "trigger_id"], name: "index_user_triggers_on_user_id_and_trigger_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hn_username"
    t.integer  "email_frequency",        default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["email_frequency"], name: "index_users_on_email_frequency", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
