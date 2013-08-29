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

ActiveRecord::Schema.define(:version => 20130829113042) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "auth_type"
    t.integer  "auth_id"
    t.text     "auth_data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authorizations", ["auth_type", "auth_id"], :name => "index_authorizations_on_auth_type_and_auth_id"
  add_index "authorizations", ["provider", "uid"], :name => "index_authorizations_on_provider_and_uid"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "weight"
    t.integer  "petitions_count", :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name"
  add_index "categories", ["weight"], :name => "index_categories_on_weight"

  create_table "petitions", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "name"
    t.integer  "targeting_count"
    t.string   "target"
    t.text     "intro"
    t.text     "content"
    t.string   "pic"
    t.string   "signed_mail_title"
    t.text     "signed_mail_body"
    t.integer  "signs_count",       :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "petitions", ["category_id"], :name => "index_petitions_on_category_id"
  add_index "petitions", ["user_id"], :name => "index_petitions_on_user_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "timelines", :force => true do |t|
    t.integer  "petition_id"
    t.datetime "happened_at"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "timelines", ["petition_id"], :name => "index_timelines_on_petition_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "name"
    t.string   "phone"
    t.string   "location"
    t.date     "birthday"
    t.string   "job"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
