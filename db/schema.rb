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

ActiveRecord::Schema.define(:version => 20121111150915) do

  create_table "adherents", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "adresse"
    t.integer  "code_postal"
    t.string   "ville"
    t.string   "tel"
    t.string   "portable"
    t.string   "mail"
    t.text     "remarques"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ateliers", :force => true do |t|
    t.string   "title"
    t.integer  "stage_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inscriptions", :force => true do |t|
    t.integer  "adherent_id"
    t.integer  "stage_id"
    t.integer  "atelier_id"
    t.text     "remarques"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "minor",         :default => false
    t.string   "room",          :default => ""
    t.text     "housing_notes", :default => ""
  end

  create_table "stages", :force => true do |t|
    t.string   "title"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.boolean  "admin",           :default => false
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
