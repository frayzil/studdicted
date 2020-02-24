class Knowledge::Concept < ApplicationRecord

  has_many :learning_skills_knowledge_concepts,
           class_name: 'Learning::SkillsKnowledgeConcept',
           foreign_key: :knowledge_concept_id,
           dependent: :destroy

  has_many :learning_skills,
           through: :learning_skills_knowledge_concepts,
           source: :skill, class_name: 'Learning::Skill'

  has_many :curriculum_sections,
           through: :learning_skills
end
