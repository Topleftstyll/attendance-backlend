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

ActiveRecord::Schema[7.0].define(version: 2022_06_29_224734) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_v1_children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "teacher_id"
    t.integer "attendance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_id"
    t.integer "guardian_id"
  end

  create_table "api_v1_groups", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "children_count", default: 0
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teacher_id"
  end

  create_table "api_v1_guardians", force: :cascade do |t|
    t.string "email"
    t.string "phone_number"
    t.integer "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
  end

  create_table "api_v1_teachers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
