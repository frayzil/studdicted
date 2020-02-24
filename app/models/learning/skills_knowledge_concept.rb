class Learning::SkillsKnowledgeConcept < ApplicationRecord
  belongs_to :skill
  belongs_to :knowledge_concept, class_name: 'Knowledge::Concept'
end
