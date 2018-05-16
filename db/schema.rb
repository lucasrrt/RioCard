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

ActiveRecord::Schema.define(version: 20180516013113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "code"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "recharges", force: :cascade do |t|
    t.integer  "card_id"
    t.money    "value",      scale: 2
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["card_id"], name: "index_recharges_on_card_id", using: :btree
  end

  create_table "travels", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "condition"
    t.index ["card_id"], name: "index_travels_on_card_id", using: :btree
    t.index ["vehicle_id"], name: "index_travels_on_vehicle_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.date     "birthdate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "fingerprint"
    t.boolean  "isStudent"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "kind"
    t.string   "line"
    t.string   "description"
    t.money    "price",       scale: 2
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_foreign_key "cards", "users"
  add_foreign_key "recharges", "cards"
  add_foreign_key "travels", "cards"
  add_foreign_key "travels", "vehicles"
end
