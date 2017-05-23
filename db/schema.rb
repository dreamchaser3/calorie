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

ActiveRecord::Schema.define(version: 20170521040235) do

  create_table "foods", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "calorie",    null: false
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "category",   null: false
    t.string   "user_email", null: false
    t.integer  "calorie"
    t.string   "output_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "replies", force: :cascade do |t|
    t.string   "content",                null: false
    t.integer  "post_id",                null: false
    t.string   "user_email",             null: false
    t.integer  "status",     default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_friends", force: :cascade do |t|
    t.string   "user_email",   default: "", null: false
    t.string   "friend_email", default: "", null: false
    t.integer  "status",       default: 0,  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                                                                                                                    null: false
    t.string   "encrypted_password",     default: "",                                                                                                                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                                                                                                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                                                                                                             null: false
    t.datetime "updated_at",                                                                                                                                             null: false
    t.string   "username"
    t.string   "background_img",         default: "http://article.images.consumerreports.org/prod/content/dam/cro/news_articles/health/CR-Health-Crop-Food-Child-10-16"
    t.string   "profile_img",            default: "https://help.github.com/assets/images/help/profile/identicon.png"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
