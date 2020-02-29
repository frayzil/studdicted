# frozen_string_literal: true

class Learning::Skill < ApplicationRecord
  has_many :skills_knowledge_concepts,
           dependent: :destroy

  has_many :knowledge_concepts,
           through: :skills_knowledge_concepts

  has_many :curriculum_sections_learning_skills,
           class_name: 'Curriculum::SectionsLearningSkill',
           foreign_key: :learning_skill_id,
           dependent: :destroy

  has_many :curriculum_sections,
           through: :curriculum_sections_learning_skills,
           source: :section, class_name: 'Curriculum::Topics::Section'

  validates_uniqueness_of :body
  validates_with Learning::Skills::BodyValidator
end
