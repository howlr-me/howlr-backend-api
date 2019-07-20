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

ActiveRecord::Schema.define(version: 2019_07_08_205736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.string "details"
    t.bigint "user_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["client_id"], name: "index_announcements_on_client_id"
    t.index ["discarded_at"], name: "index_announcements_on_discarded_at"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "announcements_tags", force: :cascade do |t|
    t.bigint "announcement_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["announcement_id"], name: "index_announcements_tags_on_announcement_id"
    t.index ["discarded_at"], name: "index_announcements_tags_on_discarded_at"
    t.index ["tag_id"], name: "index_announcements_tags_on_tag_id"
  end

  create_table "announcements_views", force: :cascade do |t|
    t.bigint "announcements_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["announcements_id"], name: "index_announcements_views_on_announcements_id"
    t.index ["discarded_at"], name: "index_announcements_views_on_discarded_at"
    t.index ["user_id"], name: "index_announcements_views_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "webpage", null: false
    t.integer "number_of_employees", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_clients_on_discarded_at"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "client_id", null: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.string "text", limit: 300, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["client_id"], name: "index_comments_on_client_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["discarded_at"], name: "index_comments_on_discarded_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "cultures", force: :cascade do |t|
    t.string "name"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["client_id"], name: "index_cultures_on_client_id"
    t.index ["discarded_at"], name: "index_cultures_on_discarded_at"
    t.index ["name", "client_id"], name: "index_cultures_on_name_and_client_id", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.string "name", limit: 64
    t.string "location"
    t.string "details"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "available_places"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["client_id"], name: "index_events_on_client_id"
    t.index ["discarded_at"], name: "index_events_on_discarded_at"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "events_tags", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_events_tags_on_discarded_at"
    t.index ["event_id"], name: "index_events_tags_on_event_id"
    t.index ["tag_id"], name: "index_events_tags_on_tag_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_roles_on_discarded_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "name"
    t.string "bg_color_hex"
    t.integer "importance_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["client_id"], name: "index_tags_on_client_id"
    t.index ["discarded_at"], name: "index_tags_on_discarded_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.bigint "client_id", null: false
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_cultures", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "culture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["culture_id"], name: "index_users_cultures_on_culture_id"
    t.index ["discarded_at"], name: "index_users_cultures_on_discarded_at"
    t.index ["user_id"], name: "index_users_cultures_on_user_id"
  end

  create_table "users_events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_users_events_on_event_id"
    t.index ["user_id"], name: "index_users_events_on_user_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_users_roles_on_discarded_at"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "views", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "client_id", null: false
    t.string "viewable_type"
    t.bigint "viewable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["client_id"], name: "index_views_on_client_id"
    t.index ["discarded_at"], name: "index_views_on_discarded_at"
    t.index ["user_id"], name: "index_views_on_user_id"
    t.index ["viewable_type", "viewable_id"], name: "index_views_on_viewable_type_and_viewable_id"
  end

end
