# frozen_string_literal: true

module Curriculum
  class Branch < ::Curriculum::Topic
    delegate :board, to: :subject

    def children_ancestry_level
      AncestryLevels::CHAPTER
    end

    def chapters
      children.where ancestry_level: children_ancestry_level
    end
  end
end
