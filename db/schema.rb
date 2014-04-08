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

ActiveRecord::Schema.define(version: 20140408015707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aspects", force: true do |t|
    t.string   "name"
    t.string   "aspectable_type"
    t.string   "aspectable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", force: true do |t|
    t.integer  "user_id"
    t.integer  "number_of_aspects"
    t.integer  "number_of_phases"
    t.integer  "skill_type_id"
    t.integer  "refresh_rate"
    t.integer  "number_of_initial_stunts"
    t.integer  "number_of_stress_boxes"
    t.integer  "skill_cap"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "skill_group_id"
  end

  create_table "characters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "refresh"
    t.integer  "campaign_id"
    t.integer  "user_id"
  end

  create_table "consequences", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "level"
    t.integer  "character_id"
    t.integer  "skill_id"
    t.integer  "skill_level_to_unlock"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "consequential_id"
    t.string   "consequential_type"
  end

  create_table "extras", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "skill_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rateable_id"
    t.string   "rateable_type"
  end

  create_table "skill_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "type"
  end

  create_table "skill_types", force: true do |t|
    t.string   "name"
    t.text     "pyramid"
    t.integer  "number_of_columns"
    t.integer  "number_of_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_group_id"
  end

  create_table "stress_levels", force: true do |t|
    t.integer  "stress_track_id"
    t.integer  "level"
    t.boolean  "checked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stress_tracks", force: true do |t|
    t.integer  "stressable_id"
    t.string   "stressable_type"
    t.string   "name"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stunts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stuntable_id"
    t.string   "stuntable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
