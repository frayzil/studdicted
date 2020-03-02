# frozen_string_literal: true

module Curriculum
  class Section < ::Curriculum::Topic
    delegate :board, to: :chapter

    has_many :sections_learning_skills,
             dependent: :destroy

    has_many :learning_skills,
             through: :sections_learning_skills
  end
end
