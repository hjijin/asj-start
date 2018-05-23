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

ActiveRecord::Schema.define(version: 2018_05_23_040217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["activation_token"], name: "index_staffs_on_activation_token"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["last_logout_at", "last_activity_at"], name: "index_staffs_on_last_logout_at_and_last_activity_at"
    t.index ["remember_me_token"], name: "index_staffs_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token"
  end

end