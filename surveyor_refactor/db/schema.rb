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

ActiveRecord::Schema.define(version: 20170821011422) do

  create_table "options", force: :cascade do |t|
    t.string   "name"
    t.integer  "question_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "selections_count", default: 0, null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name"
    t.string   "question_type"
    t.integer  "number_of_choices",   default: 2
    t.boolean  "multiple_responses"
    t.boolean  "required"
    t.integer  "survey_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "minimum_range_value", default: 0, null: false
    t.integer  "maximum_range_value", default: 0, null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "responses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "survey_id"
    t.index ["survey_id"], name: "index_responses_on_survey_id"
  end

  create_table "selections", force: :cascade do |t|
    t.integer  "response_id"
    t.integer  "option_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["option_id"], name: "index_selections_on_option_id"
    t.index ["response_id"], name: "index_selections_on_response_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "responses_count", default: 0, null: false
  end

end
