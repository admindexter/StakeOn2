# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100914215146) do

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "date_of_event"
    t.string   "photographer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "presses", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "date_of_event"
    t.string   "emphasis"
    t.string   "author"
    t.text     "information"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "specs", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.datetime "birthdate"
    t.string   "state_of_origin"
    t.string   "local_government_area"
    t.text     "residential_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "mobile_number"
    t.string   "home_number"
    t.string   "state_of_participation"
    t.string   "payment_method"
    t.string   "account_name"
    t.string   "account_number"
    t.string   "teller_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bank_name"
    t.string   "occupation"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
