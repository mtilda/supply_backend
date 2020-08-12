# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_11_184607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "date_time"
    t.string "event_type"
    t.string "delta"
    t.bigint "item_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_events_on_item_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.bigint "unit_id", null: false
    t.integer "expiration"
    t.boolean "is_tracked"
    t.boolean "is_depleted"
    t.boolean "is_running_out"
    t.bigint "supply_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supply_id"], name: "index_items_on_supply_id"
    t.index ["unit_id"], name: "index_items_on_unit_id"
  end

  create_table "supplies", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_supplies_on_group_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "symbol"
    t.string "singular"
    t.string "plural"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "handle"
    t.string "email"
    t.string "password"
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  add_foreign_key "events", "items"
  add_foreign_key "events", "users"
  add_foreign_key "items", "supplies"
  add_foreign_key "items", "units"
  add_foreign_key "supplies", "groups"
  add_foreign_key "users", "groups"
end
