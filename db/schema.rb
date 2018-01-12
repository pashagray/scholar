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

ActiveRecord::Schema.define(version: 20180112094059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admin_profiles_on_user_id"
  end

  create_table "custodian_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_custodian_profiles_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "student_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.date "date_of_admission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["date_of_admission"], name: "index_student_profiles_on_date_of_admission"
    t.index ["deleted_at"], name: "index_student_profiles_on_deleted_at"
    t.index ["user_id"], name: "index_student_profiles_on_user_id"
  end

  create_table "study_group_students", force: :cascade do |t|
    t.integer "user_id"
    t.integer "study_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_group_id"], name: "index_study_group_students_on_study_group_id"
    t.index ["user_id"], name: "index_study_group_students_on_user_id", unique: true
  end

  create_table "study_group_supervisors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "study_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "study_group_id"], name: "index_study_group_supervisors_on_user_id_and_study_group_id", unique: true
  end

  create_table "study_groups", force: :cascade do |t|
    t.string "title"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title", "level"], name: "index_study_groups_on_title_and_level", unique: true
  end

  create_table "teacher_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.date "date_of_admission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "edu_work_experience"
    t.integer "total_work_experience"
    t.index ["date_of_admission"], name: "index_teacher_profiles_on_date_of_admission"
    t.index ["deleted_at"], name: "index_teacher_profiles_on_deleted_at"
    t.index ["user_id"], name: "index_teacher_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "iin", default: "", null: false
    t.jsonb "config", default: {}
    t.date "date_of_birth"
    t.string "gender"
    t.string "temp_password"
    t.string "avatar"
    t.index ["date_of_birth"], name: "index_users_on_date_of_birth"
    t.index ["email"], name: "index_users_on_email"
    t.index ["gender"], name: "index_users_on_gender"
    t.index ["iin"], name: "index_users_on_iin", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
