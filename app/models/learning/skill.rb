# frozen_string_literal: true

class Learning::Skill < ApplicationRecord
  has_and_belongs_to_many :knowledge_concepts,
                          class_name: 'Knowledge::Concept',
                          join_table: :learning_skills_knowledge_concepts,
                          association_foreign_key: :knowledge_concept_id,
                          foreign_key: :skill_id

  has_and_belongs_to_many :curriculum_sub_topics,
                          class_name: '::Curriculum::Topic',
                          join_table: :curriculum_sub_topics_learning_skills,
                          foreign_key: :learning_skill_id,
                          association_foreign_key: :sub_topic_id
end
