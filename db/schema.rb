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

ActiveRecord::Schema.define(version: 20160406055817) do

  create_table "job_applications", force: :cascade do |t|
    t.integer  "applicant"
    t.integer  "listing"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "listing_id"
    t.text     "details"
    t.integer  "notifications_id"
  end

  add_index "job_applications", ["listing_id"], name: "index_job_applications_on_listing_id"
  add_index "job_applications", ["notifications_id"], name: "index_job_applications_on_notifications_id"
  add_index "job_applications", ["user_id"], name: "index_job_applications_on_user_id"

  create_table "listings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "poster"
    t.boolean  "is_open?"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "poster_id"
    t.integer  "job_applications_id"
    t.string   "remuneration"
  end

  add_index "listings", ["job_applications_id"], name: "index_listings_on_job_applications_id"

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.integer  "sender_id"
    t.string   "receiver_id"
    t.string   "integer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "is_read?"
    t.text     "description"
    t.integer  "job_application_id"
    t.integer  "user_id"
  end

  add_index "notifications", ["job_application_id"], name: "index_notifications_on_job_application_id"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
