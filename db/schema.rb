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

ActiveRecord::Schema.define(version: 2018_06_21_132809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "uuid"
    t.string "title"
    t.string "subtitle"
    t.string "publisher"
    t.string "image"
    t.integer "borrow_id"
    t.date "borrow_date"
    t.integer "borrow_times", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "description", comment: "描述"
    t.integer "position", default: 0, comment: "顺序"
    t.boolean "active", default: true, comment: "有效？"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.integer "staff_id"
    t.decimal "price", precision: 5, scale: 2
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.bigint "staff_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "shoppings", force: :cascade do |t|
    t.bigint "staff_id"
    t.decimal "total"
    t.text "remark"
    t.string "buyer"
    t.date "shopping_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_shoppings_on_staff_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "phone", null: false
    t.string "email"
    t.string "username"
    t.string "nickname"
    t.string "qq"
    t.string "wechat"
    t.string "sex"
    t.string "position"
    t.string "staff_type"
    t.integer "leader_id"
    t.integer "region_id"
    t.integer "job_number", comment: "工号"
    t.integer "probation_month", comment: "试用期"
    t.date "dimission_date", comment: "离职日期"
    t.date "job_date", comment: "入职日期日期"
    t.date "official_date", comment: "转正日期"
    t.float "remaining_annual_leave"
    t.float "remaining_sick_leave"
    t.boolean "active", default: true
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string "last_login_from_ip_address"
    t.string "department_id"
    t.string "birthday"
    t.index ["activation_token"], name: "index_staffs_on_activation_token"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["last_logout_at", "last_activity_at"], name: "index_staffs_on_last_logout_at_and_last_activity_at"
    t.index ["remember_me_token"], name: "index_staffs_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token"
  end

  create_table "staffs_roles", id: false, force: :cascade do |t|
    t.bigint "staff_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_staffs_roles_on_role_id"
    t.index ["staff_id", "role_id"], name: "index_staffs_roles_on_staff_id_and_role_id"
    t.index ["staff_id"], name: "index_staffs_roles_on_staff_id"
  end

  create_table "watch_bills", force: :cascade do |t|
    t.date "duty_date"
    t.integer "dayshift", default: [], array: true
    t.integer "nightshift", default: [], array: true
    t.string "remark"
    t.integer "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
