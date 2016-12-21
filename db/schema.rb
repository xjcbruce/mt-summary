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

ActiveRecord::Schema.define(version: 20161220070534) do

  create_table "annual_summaries", force: :cascade do |t|
    t.integer  "person_id",  limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "magic_params", force: :cascade do |t|
    t.float    "subject_normal_weight",  limit: 24, default: 0.0
    t.float    "subject_special_weight", limit: 24, default: 0.0
    t.float    "subject_growup_weight",  limit: 24, default: 0.0
    t.float    "rater_boss_weight",      limit: 24, default: 0.0
    t.float    "rater_manager_weight",   limit: 24, default: 0.0
    t.float    "rater_mate_weight",      limit: 24, default: 0.0
    t.float    "point_five_weight",      limit: 24, default: 0.0
    t.float    "point_four_weight",      limit: 24, default: 0.0
    t.float    "point_three_weight",     limit: 24, default: 0.0
    t.float    "point_two_weight",       limit: 24, default: 0.0
    t.float    "point_one_weight",       limit: 24, default: 0.0
    t.float    "given_five_point",       limit: 24, default: 0.0
    t.float    "given_four_point",       limit: 24, default: 0.0
    t.float    "given_three_point",      limit: 24, default: 0.0
    t.float    "given_two_point",        limit: 24, default: 0.0
    t.float    "given_one_point",        limit: 24, default: 0.0
    t.float    "level_one_weight",       limit: 24, default: 0.0
    t.float    "level_two_weight",       limit: 24, default: 0.0
    t.float    "level_three_weight",     limit: 24, default: 0.0
    t.float    "level_four_weight",      limit: 24, default: 0.0
    t.float    "level_five_weight",      limit: 24, default: 0.0
    t.float    "level_six_weight",       limit: 24, default: 0.0
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "department",  limit: 255
    t.string   "title",       limit: 255
    t.integer  "salary",      limit: 4
    t.string   "access_code", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "people", ["name"], name: "index_people_on_name", using: :btree

  create_table "rate_assignments", force: :cascade do |t|
    t.string   "target_person_name", limit: 255, null: false
    t.string   "rater_name",         limit: 255, null: false
    t.string   "rater_type",         limit: 255, null: false
    t.string   "url_code",           limit: 255, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "rate_assignments", ["url_code"], name: "index_rate_assignments_on_url_code", using: :btree

  create_table "record_details", force: :cascade do |t|
    t.integer  "record_id",         limit: 4,               null: false
    t.string   "subject_type",      limit: 255,             null: false
    t.integer  "subject_answer_no", limit: 4,   default: 0, null: false
    t.string   "question_type",     limit: 255,             null: false
    t.integer  "point_option",      limit: 4,   default: 0, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "records", force: :cascade do |t|
    t.integer  "target_person_id", limit: 4,   null: false
    t.integer  "rater_id",         limit: 4,   null: false
    t.string   "rater_type",       limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "summary_items", force: :cascade do |t|
    t.integer  "annual_summary_id", limit: 4,                 null: false
    t.string   "item_type",         limit: 255,               null: false
    t.integer  "item_no",           limit: 4,     default: 0, null: false
    t.text     "content",           limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end
