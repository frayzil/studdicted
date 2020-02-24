class Curriculum::SectionsLearningSkill < ApplicationRecord
  belongs_to :section,
             class_name: 'Curriculum::Topics::Section'
  belongs_to :learning_skill,
             class_name: 'Learning::Skill'
end
