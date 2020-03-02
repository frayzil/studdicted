class Curriculum::SectionsLearningSkill < ApplicationRecord
  belongs_to :section,
             class_name: 'Curriculum::Section'
  belongs_to :learning_skill,
             class_name: 'Learning::Skill'

  validate :learning_skill_body_should_be_valid

  validates :section,        uniqueness: { scope: :learning_skill }
  validates :learning_skill, uniqueness: { scope: :section }

  validate :section_learning_skill_mapping_should_be_unique

  def learning_skill_body
    learning_skill&.body
  end

  def learning_skill_body=(new_body)
    self.learning_skill = Learning::Skill.create_or_find_by(body: new_body)
    learning_skill.body
  end

  private

  def learning_skill_body_should_be_valid
    learning_skill.errors[:body].each { |e| errors[:learning_skill_body] << e }
  end

  def section_learning_skill_mapping_should_be_unique
    errors[:learning_skill].each { |e| errors[:learning_skill_body] << e }
  end
end
