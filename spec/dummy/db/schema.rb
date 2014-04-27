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

ActiveRecord::Schema.define(version: 20140427135759) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "translatable_menus_translatable_menu_translations", force: true do |t|
    t.integer  "translatable_menus_translatable_menu_id", null: false
    t.string   "locale",                                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "url"
  end

  add_index "translatable_menus_translatable_menu_translations", ["locale"], name: "index_afd9cffd2bd9ddb90e8434a91864e68f2212a082"
  add_index "translatable_menus_translatable_menu_translations", ["translatable_menus_translatable_menu_id"], name: "index_26c5ed1bb8ecd8b7dc47415b6efbd449698be8ed"

  create_table "translatable_menus_translatable_menus", force: true do |t|
    t.integer  "menu_id"
    t.string   "identifier"
    t.string   "default_title"
    t.string   "default_url"
    t.integer  "sort_number"
    t.string   "http_method"
    t.boolean  "require_not_signed_in"
    t.boolean  "require_signed_in"
    t.text     "require_callbacks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "translatable_menus_translatable_menus", ["identifier"], name: "identifier"
  add_index "translatable_menus_translatable_menus", ["menu_id"], name: "menu_id"

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
