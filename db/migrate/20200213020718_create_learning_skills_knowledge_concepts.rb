class CreateLearningSkillsKnowledgeConcepts < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_skills_knowledge_concepts do |t|
      t.belongs_to :skill, null: false, foreign_key: { to_table: :learning_skills }
      t.belongs_to :knowledge_concept,
                   null: false,
                   foreign_key: true,
                   index: { name: :index_l_skills_k_concepts_on_k_concept_id }

      t.timestamps
    end

    add_index :learning_skills_knowledge_concepts,
              [:skill_id, :knowledge_concept_id],
              unique: true,
              name: :index_l_skills_k_concepts_on_skill_id_and_k_concept_id
  end
end
