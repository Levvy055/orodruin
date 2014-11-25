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

ActiveRecord::Schema.define(version: 20141122185552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "auth_applications", force: true do |t|
    t.string   "name",         null: false
    t.uuid     "uid",          null: false
    t.string   "secret",       null: false
    t.string   "redirect_uri", null: false
    t.integer  "owner_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "auth_applications", ["owner_id"], name: "index_auth_applications_on_owner_id", using: :btree
  add_index "auth_applications", ["uid", "secret"], name: "index_auth_applications_on_uid_and_secret", using: :btree
  add_index "auth_applications", ["uid"], name: "index_auth_applications_on_uid", using: :btree

  create_table "auth_providers", force: true do |t|
    t.integer  "user_id"
    t.string   "type",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid",        limit: 255
  end

  add_index "auth_providers", ["type"], name: "index_auth_providers_on_type", using: :btree
  add_index "auth_providers", ["user_id"], name: "index_auth_providers_on_user_id", using: :btree

  create_table "blog_posts", force: true do |t|
    t.text     "text_raw"
    t.text     "text"
    t.string   "title",      limit: 255
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_posts", ["author_id"], name: "index_blog_posts_on_author_id", using: :btree

  create_table "conventions", force: true do |t|
    t.string   "name",       limit: 255
    t.date     "start"
    t.date     "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.integer  "user_id"
    t.integer  "convention_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["convention_id"], name: "index_participants_on_convention_id", using: :btree
  add_index "participants", ["user_id"], name: "index_participants_on_user_id", using: :btree

  create_table "participants_roles", id: false, force: true do |t|
    t.integer "participant_id"
    t.integer "role_id"
  end

  add_index "participants_roles", ["participant_id", "role_id"], name: "index_participants_roles_on_participant_id_and_role_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id"
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "nickname",               limit: 255,              null: false
    t.date     "birthday"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
