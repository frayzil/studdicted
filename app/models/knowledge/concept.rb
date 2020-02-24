class Knowledge::Concept < ApplicationRecord
  has_and_belongs_to_many :learning_skills,
                          class_name: 'Learning::Skill',
                          join_table: :learning_skills_knowledge_concepts,
                          foreign_key: :knowledge_concept_id,
                          association_foreign_key: :skill_id

  has_many :curriculum_sections,
           through: :learning_skills,
           class_name: '::Curriculum::Topic'
end
