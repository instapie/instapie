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

ActiveRecord::Schema.define(version: 20130808132045) do

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id", null: false
    t.integer  "option_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["user_id", "question_id"], name: "index_answers_on_user_id_and_question_id", unique: true

  create_table "options", force: true do |t|
    t.integer  "question_id",   null: false
    t.string   "option",        null: false
    t.integer  "answers_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id"

  create_table "questions", force: true do |t|
    t.integer  "user_id",                   null: false
    t.string   "question",                  null: false
    t.text     "description"
    t.integer  "answers_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                       null: false
    t.string   "name",                        null: false
    t.string   "image_url"
    t.string   "password_digest",             null: false
    t.integer  "questions_count", default: 0
    t.integer  "answers_count",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end