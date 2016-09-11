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

ActiveRecord::Schema.define(version: 20150530023143) do

  create_table "hosts", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "uri",             limit: 255
    t.string   "avatar",          limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "twitter_account", limit: 255
    t.text     "twitter_data",    limit: 65535
    t.integer  "twitter_id",      limit: 4
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "uri",             limit: 255
    t.string   "avatar",          limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "twitter_account", limit: 255
    t.text     "twitter_data",    limit: 65535
    t.integer  "twitter_id",      limit: 4
  end

  create_table "project_hosts", force: :cascade do |t|
    t.integer  "project_id", limit: 4,   null: false
    t.integer  "host_id",    limit: 4,   null: false
    t.integer  "order",      limit: 4
    t.string   "label",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "project_people", force: :cascade do |t|
    t.integer  "project_id", limit: 4,   null: false
    t.integer  "person_id",  limit: 4,   null: false
    t.integer  "order",      limit: 4
    t.string   "label",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "subtitle",    limit: 255
    t.string   "category",    limit: 255
    t.string   "uri",         limit: 255
    t.text     "image",       limit: 65535
    t.datetime "date"
    t.datetime "end_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "description", limit: 65535
    t.string   "manual_date", limit: 255
  end

end
