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

ActiveRecord::Schema.define(version: 2020_03_21_141317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "baskets", force: :cascade do |t|
    t.string "status", default: "pending"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.integer "total_cents", default: 0, null: false
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "clothes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.integer "price_cents", default: 0, null: false
    t.string "sku"
    t.boolean "publish", default: false
  end

  create_table "clothes_colors", id: false, force: :cascade do |t|
    t.bigint "clothe_id"
    t.bigint "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothe_id"], name: "index_clothes_colors_on_clothe_id"
    t.index ["color_id"], name: "index_clothes_colors_on_color_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "hex"
  end

  create_table "details", force: :cascade do |t|
    t.text "information"
    t.bigint "clothe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothe_id"], name: "index_details_on_clothe_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size"
    t.integer "quantity"
    t.string "color"
    t.string "status", default: "pending"
    t.string "clothe_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.integer "total_cents", default: 0, null: false
    t.bigint "basket_id"
    t.bigint "user_id"
    t.bigint "clothe_id"
    t.index ["basket_id"], name: "index_transactions_on_basket_id"
    t.index ["clothe_id"], name: "index_transactions_on_clothe_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.text "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "baskets", "users"
  add_foreign_key "clothes_colors", "clothes"
  add_foreign_key "clothes_colors", "colors"
  add_foreign_key "details", "clothes"
  add_foreign_key "transactions", "baskets"
  add_foreign_key "transactions", "clothes"
  add_foreign_key "transactions", "users"
end
