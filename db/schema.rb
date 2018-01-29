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

ActiveRecord::Schema.define(version: 20180134085051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "academic_fractions", force: :cascade do |t|
    t.string "title"
    t.date "starts_on"
    t.date "ends_on"
    t.integer "academic_period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "academic_periods", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admin_profiles_on_user_id"
  end

  create_table "adverts", force: :cascade do |t|
    t.string "advertable_type"
    t.integer "advertable_id"
    t.string "title"
    t.text "content"
    t.integer "author_id"
    t.boolean "pinned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertable_id"], name: "index_adverts_on_advertable_id"
    t.index ["advertable_type", "advertable_id"], name: "index_adverts_on_advertable_type_and_advertable_id"
    t.index ["advertable_type"], name: "index_adverts_on_advertable_type"
    t.index ["author_id"], name: "index_adverts_on_author_id"
    t.index ["pinned"], name: "index_adverts_on_pinned"
  end

  create_table "attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "attachmentable_type"
    t.integer "attachmentable_id"
    t.string "doc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachmentable_id"], name: "index_attachments_on_attachmentable_id"
    t.index ["attachmentable_type", "attachmentable_id"], name: "index_attachments_on_attachmentable_type_and_attachmentable_id"
    t.index ["attachmentable_type"], name: "index_attachments_on_attachmentable_type"
    t.index ["doc"], name: "index_attachments_on_doc"
  end

  create_table "chat_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "chat_id"
    t.index ["chat_id"], name: "index_chat_members_on_chat_id"
    t.index ["user_id"], name: "index_chat_members_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "custodian_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_custodian_profiles_on_user_id"
  end

  create_table "journal_fractions", force: :cascade do |t|
    t.integer "journal_id"
    t.date "starts_on"
    t.date "ends_on"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ends_on"], name: "index_journal_fractions_on_ends_on"
    t.index ["journal_id"], name: "index_journal_fractions_on_journal_id"
    t.index ["starts_on"], name: "index_journal_fractions_on_starts_on"
    t.index ["title"], name: "index_journal_fractions_on_title"
  end

  create_table "journals", force: :cascade do |t|
    t.string "subject_id", null: false
    t.string "journable_type", null: false
    t.integer "journable_id", null: false
    t.integer "teacher_id", null: false
    t.integer "academic_period_id", null: false
    t.boolean "published", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fraction_grading_formula"
    t.string "period_grading_formula"
    t.string "grading_system"
    t.index ["journable_id"], name: "index_journals_on_journable_id"
    t.index ["journable_type", "journable_id"], name: "index_journals_on_journable_type_and_journable_id"
    t.index ["journable_type"], name: "index_journals_on_journable_type"
    t.index ["published"], name: "index_journals_on_published"
    t.index ["subject_id"], name: "index_journals_on_subject_id"
    t.index ["teacher_id"], name: "index_journals_on_teacher_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.date "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "journal_fraction_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.index ["day"], name: "index_lessons_on_day"
    t.index ["journal_fraction_id"], name: "index_lessons_on_journal_fraction_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chat_id"
    t.bigint "user_id"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.string "notifiable_type", null: false
    t.integer "notifiable_id", null: false
    t.string "key", null: false
    t.string "group_type"
    t.integer "group_id"
    t.integer "group_owner_id"
    t.string "notifier_type"
    t.integer "notifier_id"
    t.text "parameters"
    t.datetime "opened_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_owner_id"], name: "index_notifications_on_group_owner_id"
    t.index ["group_type", "group_id"], name: "index_notifications_on_group_type_and_group_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["notifier_type", "notifier_id"], name: "index_notifications_on_notifier_type_and_notifier_id"
    t.index ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id"
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
    t.string "avatar"
    t.index ["title", "level"], name: "index_study_groups_on_title_and_level", unique: true
  end

  create_table "study_sub_group_students", force: :cascade do |t|
    t.integer "study_sub_group_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_sub_group_id"], name: "index_study_sub_group_students_on_study_sub_group_id"
    t.index ["user_id", "study_sub_group_id"], name: "index_ssgs_on_user_id_and_study_sub_group_id", unique: true
    t.index ["user_id"], name: "index_study_sub_group_students_on_user_id"
  end

  create_table "study_sub_groups", force: :cascade do |t|
    t.integer "study_group_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_subjects_on_title", unique: true
  end

  create_table "subscriptions", id: :serial, force: :cascade do |t|
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.string "key", null: false
    t.boolean "subscribing", default: true, null: false
    t.boolean "subscribing_to_email", default: true, null: false
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "subscribed_to_email_at"
    t.datetime "unsubscribed_to_email_at"
    t.text "optional_targets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_subscriptions_on_key"
    t.index ["target_type", "target_id", "key"], name: "index_subscriptions_on_target_type_and_target_id_and_key", unique: true
    t.index ["target_type", "target_id"], name: "index_subscriptions_on_target_type_and_target_id"
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

  create_table "user_groups", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_user_groups_on_title", unique: true
  end

  create_table "user_in_groups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "user_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_group_id"], name: "index_user_in_groups_on_user_group_id"
    t.index ["user_id", "user_group_id"], name: "index_user_in_groups_on_user_id_and_user_group_id", unique: true
    t.index ["user_id"], name: "index_user_in_groups_on_user_id"
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

  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
end
