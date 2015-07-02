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

ActiveRecord::Schema.define(version: 20150701061559) do

  create_table "extract_words", force: :cascade do |t|
    t.string   "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interacts", force: :cascade do |t|
    t.integer  "m1"
    t.integer  "m2"
    t.string   "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "molecule_synonyms", force: :cascade do |t|
    t.integer  "molecule_id"
    t.string   "synonym"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "molecule_synonyms", ["molecule_id"], name: "index_molecule_synonyms_on_molecule_id"

  create_table "molecules", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sentences", force: :cascade do |t|
    t.string   "sen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
