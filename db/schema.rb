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

ActiveRecord::Schema.define(version: 2020_02_18_001113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "curriculum_board_subjects", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_curriculum_board_subjects_on_board_id"
    t.index ["subject_id"], name: "index_curriculum_board_subjects_on_subject_id"
  end

  create_table "curriculum_boards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "curriculum_sub_topics_learning_skills", force: :cascade do |t|
    t.bigint "sub_topic_id", null: false
    t.bigint "learning_skill_id", null: false
    t.integer "grade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["learning_skill_id"], name: "index_c_sub_topics_l_skills_on_l_skill_id"
    t.index ["sub_topic_id"], name: "index_curriculum_sub_topics_learning_skills_on_sub_topic_id"
  end

# Could not dump table "curriculum_topics" because of following StandardError
#   Unknown type 'curriculum_topic_ancestry_level' for column 'ancestry_level'

  create_table "knowledge_concepts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "learning_skills", force: :cascade do |t|
    t.string "body"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "learning_skills_knowledge_concepts", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "knowledge_concept_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["knowledge_concept_id"], name: "index_l_skills_k_concepts_on_k_concept_id"
    t.index ["skill_id"], name: "index_learning_skills_knowledge_concepts_on_skill_id"
  end

  add_foreign_key "curriculum_board_subjects", "curriculum_boards", column: "board_id"
  add_foreign_key "curriculum_board_subjects", "curriculum_topics", column: "subject_id"
  add_foreign_key "curriculum_sub_topics_learning_skills", "curriculum_topics", column: "sub_topic_id"
  add_foreign_key "curriculum_sub_topics_learning_skills", "learning_skills"
  add_foreign_key "learning_skills_knowledge_concepts", "knowledge_concepts"
  add_foreign_key "learning_skills_knowledge_concepts", "learning_skills", column: "skill_id"
end
