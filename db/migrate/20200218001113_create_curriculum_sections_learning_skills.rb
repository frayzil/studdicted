class CreateCurriculumSectionsLearningSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_sections_learning_skills do |t|
      t.belongs_to :section, null: false, foreign_key: { to_table: :curriculum_topics }
      t.belongs_to :learning_skill,
                   null: false,
                   foreign_key: true,
                   index: { name: :index_c_sections_l_skills_on_l_skill_id }
      t.integer :grade

      t.timestamps
    end
  end
end
