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

ActiveRecord::Schema.define(version: 20170513131042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "uid",                 null: false
    t.text     "keywords"
    t.integer  "kind",                null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "display_picture_url"
    t.string   "name"
    t.index ["project_id"], name: "index_accounts_on_project_id", using: :btree
  end

  create_table "issues", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "title"
    t.text     "description"
    t.string   "uid"
    t.text     "issue_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_issues_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "trello_board_uid"
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "account_id"
    t.text     "title"
    t.text     "description"
    t.integer  "rating"
    t.text     "sentiment"
    t.string   "uid"
    t.string   "author"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["account_id"], name: "index_reviews_on_account_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
