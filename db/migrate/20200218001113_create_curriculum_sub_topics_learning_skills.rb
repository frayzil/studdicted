class CreateCurriculumSubTopicsLearningSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_sub_topics_learning_skills do |t|
      t.belongs_to :sub_topic, null: false, foreign_key: { to_table: :curriculum_topics }
      t.belongs_to :learning_skill,
                   null: false,
                   foreign_key: true,
                   index: { name: :index_c_sub_topics_l_skills_on_l_skill_id }
      t.integer :grade

      t.timestamps
    end
  end
end
