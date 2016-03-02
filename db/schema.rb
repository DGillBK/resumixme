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

ActiveRecord::Schema.define(version: 20160302024556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "education_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "achievements", ["education_id"], name: "index_achievements_on_education_id", using: :btree

  create_table "degrees", force: :cascade do |t|
    t.string   "level"
    t.boolean  "completed"
    t.integer  "education_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "degrees", ["education_id"], name: "index_degrees_on_education_id", using: :btree

  create_table "educations", force: :cascade do |t|
    t.string   "name"
    t.date     "startDate"
    t.date     "endDate"
    t.integer  "gpa"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "educations", ["user_id"], name: "index_educations_on_user_id", using: :btree

  create_table "employments", force: :cascade do |t|
    t.string   "name"
    t.date     "startDate"
    t.date     "endDate"
    t.string   "address"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employments", ["user_id"], name: "index_employments_on_user_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "interests", ["user_id"], name: "index_interests_on_user_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "language"
    t.string   "fluency"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "languages", ["user_id"], name: "index_languages_on_user_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "title"
    t.date     "startDate"
    t.date     "endDate"
    t.integer  "employment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "positions", ["employment_id"], name: "index_positions_on_employment_id", using: :btree

  create_table "responsibilities", force: :cascade do |t|
    t.text     "description"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "responsibilities", ["position_id"], name: "index_responsibilities_on_position_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "skills"
    t.string   "languages"
    t.string   "interests"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "skilltype_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "skills", ["skilltype_id"], name: "index_skills_on_skilltype_id", using: :btree

  create_table "skilltypes", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skilltypes", ["user_id"], name: "index_skilltypes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.string   "url"
    t.string   "linkedin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "achievements", "educations"
  add_foreign_key "degrees", "educations"
  add_foreign_key "educations", "users"
  add_foreign_key "employments", "users"
  add_foreign_key "interests", "users"
  add_foreign_key "languages", "users"
  add_foreign_key "positions", "employments"
  add_foreign_key "responsibilities", "positions"
  add_foreign_key "resumes", "users"
  add_foreign_key "skills", "skilltypes"
  add_foreign_key "skilltypes", "users"
end
