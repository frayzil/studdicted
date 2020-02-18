# frozen_string_literal: true

module Curriculum
  module Topics
    class SubTopic < ::Curriculum::Topic
      delegate :board, to: :topic

      has_and_belongs_to_many :learning_skills,
                              class_name: 'Learning::Skill',
                              join_table: :curriculum_sub_topics_learning_skills,
                              foreign_key: :sub_topic_id,
                              association_foreign_key: :learning_skill_id
    end
  end
end
