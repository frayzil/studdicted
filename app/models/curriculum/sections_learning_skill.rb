class Curriculum::SectionsLearningSkill < ApplicationRecord
  belongs_to :section
  belongs_to :learning_skill
end
