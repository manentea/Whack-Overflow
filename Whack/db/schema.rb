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

ActiveRecord::Schema.define(version: 20150612205455) do

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "question_id", null: false
    t.string   "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "body",             null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "votevalue"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votes", ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"

end
