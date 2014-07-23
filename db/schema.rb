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

ActiveRecord::Schema.define(version: 20140703135408) do

  create_table "annochannels", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "channel_id"
    t.boolean  "showable",    default: true
    t.string   "header"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
    t.string   "class_name"
  end

  create_table "annotations", force: true do |t|
    t.integer  "annochannel_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shape"
    t.integer  "posx"
    t.integer  "posy"
    t.integer  "height"
    t.integer  "width"
    t.string   "class_name"
  end

  create_table "calculated_data", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "channel_id"
    t.hstore   "channel_slots"
    t.hstore   "channel_spots"
    t.hstore   "channel_maxes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "channel_name"
  end

  create_table "campaigns", force: true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tg"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "markets"
    t.boolean  "active",             default: true
    t.string   "cfile_file_name"
    t.string   "cfile_content_type"
    t.integer  "cfile_file_size"
    t.datetime "cfile_updated_at"
    t.string   "sfile_file_name"
    t.string   "sfile_content_type"
    t.integer  "sfile_file_size"
    t.datetime "sfile_updated_at"
  end

  create_table "channels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain"
    t.boolean  "internal"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "cslides", force: true do |t|
    t.integer  "child_id"
    t.integer  "slide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customizations", force: true do |t|
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "hours", force: true do |t|
    t.string   "name"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentation_templates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "footer"
    t.integer  "presentation_id"
    t.integer  "slide_id"
  end

  create_table "presentations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "presesntation_slides", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presesntations", force: true do |t|
    t.string   "header"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "slides", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
    t.integer  "seq"
  end

  create_table "slots", force: true do |t|
    t.integer  "channel_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "hour_id"
    t.float    "tvr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campaign_id"
  end

  create_table "spots", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "hour_id"
    t.integer  "channel_id"
    t.date     "airdate"
    t.string   "programme"
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
    t.integer  "client_id"
  end

  add_index "users", ["client_id"], name: "index_users_on_client_id", using: :btree
  add_index "users", ["email", "client_id"], name: "index_users_on_email_and_client_id", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
