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

ActiveRecord::Schema.define(:version => 20121214201153) do

  create_table "badges", :force => true do |t|
    t.integer  "companytoevent_id"
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "companies", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "logo"
    t.string   "website"
    t.boolean  "formlocked"
    t.boolean  "badgeslocked"
    t.integer  "lunch"
    t.text     "comment"
  end

  create_table "companytoevents", :force => true do |t|
    t.integer  "company_id"
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "stand_size"
    t.string   "stand_id"
    t.integer  "lunch"
    t.integer  "desk"
    t.integer  "chair"
    t.integer  "table"
    t.integer  "trash"
    t.integer  "clothesrack"
    t.integer  "shelf"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "login"
    t.string   "password"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jobs", :force => true do |t|
    t.integer  "companytoevent_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stands", :force => true do |t|
    t.integer  "companytoevent_id"
    t.string   "name"
    t.string   "size"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "event_id"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end