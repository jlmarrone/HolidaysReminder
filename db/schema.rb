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

ActiveRecord::Schema.define(:version => 20111226142404) do

  create_table "client_holidays", :force => true do |t|
    t.integer  "client_id"
    t.integer  "holiday_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_notifications", :force => true do |t|
    t.integer  "client_id"
    t.integer  "holiday_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "country_id"
    t.integer  "holiday_id"
    t.boolean  "notified"
  end

  create_table "clients_notifications", :force => true do |t|
    t.integer  "client_id"
    t.integer  "holiday_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "Country_Name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
  end

  create_table "holidays", :force => true do |t|
    t.string   "description",  :null => false
    t.date     "holiday_date", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "notified"
    t.integer  "country_id"
    t.integer  "client_id"
    t.integer  "user_id"
  end

  create_table "states", :force => true do |t|
    t.string   "State_Name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                     :null => false
    t.string   "email",                                    :null => false
    t.string   "password",                                 :null => false
    t.string   "password_confirmation",                    :null => false
    t.boolean  "active",                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.integer  "state_id"
  end

end
