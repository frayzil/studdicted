class Learning::SkillsKnowledgeConcept < ApplicationRecord

  belongs_to :skill
  belongs_to :knowledge_concept, class_name: 'Knowledge::Concept'

  def skill_body
    skill&.body
  end

  def skill_body=(new_body)
    self.skill = Learning::Skill.create_or_find_by!(
      body: new_body
    )
  end
end
