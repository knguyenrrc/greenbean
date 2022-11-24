# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_24_044204) do
  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.integer "Province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Province_id"], name: "index_addresses_on_Province_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_name"
    t.integer "phone"
    t.string "email"
    t.integer "Address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Address_id"], name: "index_customers_on_Address_id"
  end

  create_table "order_line_items", force: :cascade do |t|
    t.float "price"
    t.integer "quantity"
    t.float "total_tax_rate"
    t.integer "Order_id", null: false
    t.integer "Product_id", null: false
    t.integer "Tax_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Order_id"], name: "index_order_line_items_on_Order_id"
    t.index ["Product_id"], name: "index_order_line_items_on_Product_id"
    t.index ["Tax_id"], name: "index_order_line_items_on_Tax_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "total_amount"
    t.date "date_created"
    t.integer "Customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Customer_id"], name: "index_orders_on_Customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.float "price"
    t.integer "Category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Category_id"], name: "index_products_on_Category_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "province_name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.float "pst"
    t.float "gst"
    t.float "hst"
    t.float "total_tax_rate"
    t.integer "Province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Province_id"], name: "index_taxes_on_Province_id"
  end

  add_foreign_key "addresses", "Provinces"
  add_foreign_key "customers", "Addresses"
  add_foreign_key "order_line_items", "Orders"
  add_foreign_key "order_line_items", "Products"
  add_foreign_key "order_line_items", "Taxes"
  add_foreign_key "orders", "Customers"
  add_foreign_key "products", "Categories"
  add_foreign_key "taxes", "Provinces"
end