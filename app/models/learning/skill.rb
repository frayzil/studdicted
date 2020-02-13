class Learning::Skill < ApplicationRecord
  has_and_belongs_to_many :knowledge_concepts,
                          class_name: 'Knowledge::Concept',
                          join_table: :learning_skills_knowledge_concepts,
                          association_foreign_key: :knowledge_concept_id,
                          foreign_key: :skill_id
end
