# frozen_string_literal: true

module Curriculum
  module Topics
    class Section < ::Curriculum::Topic
      delegate :board, to: :topic

      has_and_belongs_to_many :learning_skills,
                              class_name: 'Learning::Skill',
                              join_table: :curriculum_sections_learning_skills,
                              foreign_key: :section_id,
                              association_foreign_key: :learning_skill_id
    end
  end
end
