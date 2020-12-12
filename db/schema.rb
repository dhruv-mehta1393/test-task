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

ActiveRecord::Schema.define(version: 20201212082059) do

  create_table "campaigns", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "purpose",      limit: 65535
    t.integer  "est_duration", limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.integer  "user_id",          limit: 4
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "discussions", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "campaign_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "campaign_id", limit: 4
    t.integer  "tag_id",      limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "taggings", ["campaign_id"], name: "index_taggings_on_campaign_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "parent_id",  limit: 4
  end

  create_table "todos", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "campaign_id", limit: 4
  end

  add_index "todos", ["campaign_id"], name: "index_todos_on_campaign_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "profession",             limit: 255
    t.string   "service",                limit: 255
    t.string   "username",               limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "status",                 limit: 4
    t.integer  "role",                   limit: 4
    t.string   "type",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "users"
  add_foreign_key "taggings", "campaigns"
  add_foreign_key "taggings", "tags"
  add_foreign_key "todos", "campaigns"
end
