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

ActiveRecord::Schema.define(version: 20150511161002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name",                             null: false
    t.string   "street"
    t.string   "island",     default: "Hithadhoo"
    t.string   "atoll",      default: "Addu City"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "addresses", ["name"], name: "index_addresses_on_name", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customer_addresses", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "address_id"
    t.boolean  "primary",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "customer_addresses", ["address_id"], name: "index_customer_addresses_on_address_id", using: :btree
  add_index "customer_addresses", ["customer_id"], name: "index_customer_addresses_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name", limit: 45, null: false
    t.string   "last_name",  limit: 45
    t.date     "dob"
    t.boolean  "gender",                null: false
    t.string   "email",                 null: false
    t.string   "contact",    limit: 10, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "contact"
    t.string   "email"
    t.string   "designation"
    t.date     "date_joined"
    t.integer  "role_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "employees", ["first_name"], name: "index_employees_on_first_name", using: :btree
  add_index "employees", ["last_name"], name: "index_employees_on_last_name", using: :btree
  add_index "employees", ["role_id"], name: "index_employees_on_role_id", using: :btree

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "units"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id", using: :btree
  add_index "order_products", ["product_id"], name: "index_order_products_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "status"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "category_id", null: false
    t.string   "size"
    t.decimal  "price",       null: false
    t.boolean  "visible"
    t.string   "image_link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
