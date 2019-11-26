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

ActiveRecord::Schema.define(version: 2019_11_26_034359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concept_tags", force: :cascade do |t|
    t.bigint "concept_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concept_id"], name: "index_concept_tags_on_concept_id"
    t.index ["tag_id"], name: "index_concept_tags_on_tag_id"
  end

  create_table "concepts", force: :cascade do |t|
    t.text "prompt"
    t.text "content"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_concepts_on_document_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.datetime "submitted_at"
    t.datetime "end_at"
    t.bigint "user_id"
    t.bigint "folder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_documents_on_folder_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "revision_sessions", force: :cascade do |t|
    t.datetime "scheduled_at"
    t.datetime "completed_at"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_revision_sessions_on_document_id"
  end

  create_table "session_answers", force: :cascade do |t|
    t.boolean "correct"
    t.bigint "revision_session_id"
    t.bigint "concept_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concept_id"], name: "index_session_answers_on_concept_id"
    t.index ["revision_session_id"], name: "index_session_answers_on_revision_session_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "concept_tags", "concepts"
  add_foreign_key "concept_tags", "tags"
  add_foreign_key "concepts", "documents"
  add_foreign_key "documents", "folders"
  add_foreign_key "documents", "users"
  add_foreign_key "folders", "users"
  add_foreign_key "revision_sessions", "documents"
  add_foreign_key "session_answers", "concepts"
  add_foreign_key "session_answers", "revision_sessions"
end
