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

ActiveRecord::Schema.define(version: 20140108142507) do

  create_table "addresses", force: true do |t|
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.integer  "order_id"
  end

  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id"

  create_table "authors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.text     "biography"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", force: true do |t|
    t.string   "number"
    t.integer  "cvv"
    t.integer  "exp_m"
    t.integer  "exp_y"
    t.string   "fname"
    t.string   "lname"
    t.integer  "customer_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_cards", ["order_id"], name: "index_credit_cards_on_order_id"

  create_table "customer_orders", force: true do |t|
    t.integer  "customer_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.float    "price"
    t.integer  "quantity",   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.float    "total_price",              default: 0.0
    t.string   "state"
    t.datetime "completed_at", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "product_authors", force: true do |t|
    t.integer  "product_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_authors", ["author_id"], name: "index_product_authors_on_author_id"
  add_index "product_authors", ["product_id"], name: "index_product_authors_on_product_id"

  create_table "product_types", force: true do |t|
    t.integer  "product_id"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_types", ["product_id"], name: "index_product_types_on_product_id"
  add_index "product_types", ["type_id"], name: "index_product_types_on_type_id"

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "in_stock"
  end

  create_table "ratings", force: true do |t|
    t.integer  "product_id"
    t.integer  "customer_id"
    t.float    "rating"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["customer_id"], name: "index_ratings_on_customer_id"
  add_index "ratings", ["product_id"], name: "index_ratings_on_product_id"

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
