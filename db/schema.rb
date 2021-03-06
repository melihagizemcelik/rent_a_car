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

ActiveRecord::Schema.define(version: 20171218141936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "brandName"
    t.text "brandDesc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "catName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "cusFName"
    t.string "cusLName"
    t.boolean "cusGender", default: false
    t.string "cusMail"
    t.string "cusPhone"
    t.text "cusAdress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "modelName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_models_on_brand_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.datetime "startDate"
    t.datetime "finishDate"
    t.boolean "paymentSt", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vehicle_id"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_rentals_on_customer_id"
    t.index ["vehicle_id"], name: "index_rentals_on_vehicle_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "roleName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "firstName"
    t.string "lastname"
    t.string "adress"
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "licensePlate"
    t.string "kilometer"
    t.string "year"
    t.string "engineCapacity"
    t.integer "rentMoney"
    t.datetime "inspectionDate"
    t.boolean "rented", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "model_id"
    t.index ["category_id"], name: "index_vehicles_on_category_id"
    t.index ["model_id"], name: "index_vehicles_on_model_id"
  end

  add_foreign_key "models", "brands"
  add_foreign_key "rentals", "customers"
  add_foreign_key "rentals", "vehicles"
  add_foreign_key "users", "roles"
  add_foreign_key "vehicles", "categories"
  add_foreign_key "vehicles", "models"
end
