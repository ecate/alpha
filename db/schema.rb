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

ActiveRecord::Schema.define(:version => 20120127103308) do

  create_table "convocationjours", :force => true do |t|
    t.integer  "mission_id"
    t.date     "jourconvoc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "corps", :force => true do |t|
    t.string "nom"
  end

  create_table "grades", :force => true do |t|
    t.string  "nom"
    t.integer "corp_id"
  end

  create_table "jours", :force => true do |t|
    t.integer  "roster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "convocationjour_id"
  end

  create_table "missions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code_activite"
    t.boolean  "encours"
    t.text     "description"
  end

  create_table "rosters", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "convoc"
    t.boolean  "but"
    t.string   "butvilledepart"
    t.text     "comment"
    t.datetime "harrivee"
    t.datetime "hdepart"
    t.integer  "mission_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "nom"
    t.string   "prenom"
    t.boolean  "actif"
    t.integer  "grade_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
