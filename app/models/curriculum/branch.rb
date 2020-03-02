# frozen_string_literal: true

module Curriculum
  class Branch < ::Curriculum::Topic
    delegate :board, to: :subject

    def children_ancestroy_level
      AncestryLevel::CHAPTER
    end

    def chapters
      children.where ancestry_level: children_ancestroy_level
    end
  end
end
