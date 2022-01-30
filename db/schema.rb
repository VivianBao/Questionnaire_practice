# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_30_103201) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "options", force: :cascade do |t|
    t.integer "question_id"
    t.integer "option_type"
    t.string "option_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "question_options", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["option_id"], name: "index_question_options_on_option_id"
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.integer "reviewer_id", null: false
    t.integer "reviewee_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reviewee_id"], name: "index_questionnaires_on_reviewee_id"
    t.index ["reviewer_id"], name: "index_questionnaires_on_reviewer_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "questionnaire_id", null: false
    t.integer "question_type"
    t.string "question_text"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "subcategory_id"
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
    t.index ["subcategory_id"], name: "index_questions_on_subcategory_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "questionnaire_id", null: false
    t.index ["questionnaire_id"], name: "index_reports_on_questionnaire_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "response_type"
    t.string "response_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "report_id"
    t.index ["report_id"], name: "index_responses_on_report_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_teams_on_company_id"
  end

  create_table "traits", force: :cascade do |t|
    t.integer "subcategory_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subcategory_id"], name: "index_traits_on_subcategory_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "team_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "question_options", "options"
  add_foreign_key "question_options", "questions"
  add_foreign_key "questionnaires", "users", column: "reviewee_id"
  add_foreign_key "questionnaires", "users", column: "reviewer_id"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "questions", "subcategories"
  add_foreign_key "reports", "questionnaires"
  add_foreign_key "responses", "reports"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "teams", "companies"
  add_foreign_key "traits", "subcategories"
  add_foreign_key "users", "teams"
end
