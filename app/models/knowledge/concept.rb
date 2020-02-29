class Knowledge::Concept < ApplicationRecord

  has_many :concepts_learning_skills,
           class_name: 'Learning::SkillsKnowledgeConcept',
           foreign_key: :knowledge_concept_id,
           dependent: :destroy

  has_many :learning_skills,
           through: :concepts_learning_skills,
           source: :skill, class_name: 'Learning::Skill'

  has_many :curriculum_sections,
           through: :learning_skills
end
