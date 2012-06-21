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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120621212725) do

  create_table "people", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "uid"
    t.string   "guest_token"
    t.string   "guest_email"
  end

  create_table "question_multiple_choices", :force => true do |t|
    t.integer  "question_id"
    t.string   "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "question_responses", :force => true do |t|
    t.integer  "question_id"
    t.integer  "reservation_id"
    t.string   "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "order"
    t.string   "question"
    t.boolean  "is_multiple_choice"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "person_id"
    t.string   "exchange_event_id"
    t.datetime "cache_start_time"
    t.datetime "cache_end_time"
    t.integer  "recurrence_id"
    t.integer  "questionnaire_response_id"
    t.integer  "package_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "resource_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resource_periods", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "length"
    t.datetime "start_time"
    t.integer  "skip_duration"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.text     "description"
    t.string   "exchange_url"
    t.integer  "ou_uid"
    t.integer  "week_field"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "allow_anonymous"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "roles", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
