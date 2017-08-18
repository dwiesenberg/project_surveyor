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

ActiveRecord::Schema.define(version: 20160805222943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "multiple_choices", force: :cascade do |t|
    t.string   "choice",      null: false
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "multiple_choices", ["question_id"], name: "index_multiple_choices_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question",   null: false
    t.string   "type",       null: false
    t.boolean  "required",   null: false
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "range_choices", force: :cascade do |t|
    t.integer  "min",         null: false
    t.integer  "max",         null: false
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "range_choices", ["question_id"], name: "index_range_choices_on_question_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "multiple_choices", "questions"
  add_foreign_key "questions", "surveys"
  add_foreign_key "range_choices", "questions"
end
