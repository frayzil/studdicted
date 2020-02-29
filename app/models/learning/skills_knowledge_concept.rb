# frozen_string_literal: true

class Learning::SkillsKnowledgeConcept < ApplicationRecord
  belongs_to :skill
  belongs_to :knowledge_concept, class_name: 'Knowledge::Concept'

  validate :skill_body_should_be_valid
  validate :knowledge_concept_title_should_be_valid

  validates :skill,             uniqueness: { scope: :knowledge_concept }
  validates :knowledge_concept, uniqueness: { scope: :skill }

  validate :skill_knowledge_concept_mapping_should_be_unique

  def skill_body
    skill&.body
  end

  def skill_body=(new_body)
    self.skill = Learning::Skill.create_or_find_by(body: new_body)
    skill.body
  end

  def knowledge_concept_title
    knowledge_concept&.title
  end

  def knowledge_concept_title=(new_title)
    self.knowledge_concept = Knowledge::Concept.create_or_find_by(title: new_title)
    knowledge_concept.title
  end

  private

  def skill_body_should_be_valid
    skill.errors[:body].each { |e| errors[:skill_body] << e }
  end

  def knowledge_concept_title_should_be_valid
    knowledge_concept.errors[:title].each { |e| errors[:knowledge_concept_title] << e }
  end

  def skill_knowledge_concept_mapping_should_be_unique
    errors[:skill].each             { |e| errors[:skill_body] << e }
    errors[:knowledge_concept].each { |e| errors[:knowledge_concept_title] << e }
  end
end
