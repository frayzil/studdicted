# frozen_string_literal: true

module Curriculum
  module Topics
    class Section < ::Curriculum::Topic
      delegate :board, to: :topic

      has_many :sections_learning_skills,
               dependent: :destroy

      has_many :learning_skills,
               through: :sections_learning_skills
    end
  end
end
