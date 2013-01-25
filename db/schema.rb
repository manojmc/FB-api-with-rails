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

ActiveRecord::Schema.define(:version => 20130125062020) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.integer  "seats"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "image"
  end

  create_table "users_courses", :force => true do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.boolean "wl",        :default => false
    t.boolean "active",    :default => true
  end

  add_index "users_courses", ["course_id"], :name => "index_users_courses_on_course_id"
  add_index "users_courses", ["user_id"], :name => "index_users_courses_on_user_id"

end
