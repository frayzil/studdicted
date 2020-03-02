class Curriculum::SectionsLearningSkill < ApplicationRecord
  belongs_to :section,
             class_name: 'Curriculum::Section'
  belongs_to :learning_skill,
             class_name: 'Learning::Skill'
end
