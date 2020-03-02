# frozen_string_literal: true

module Curriculum
  class Chapter < ::Curriculum::Topic
    delegate :board, to: :branch

    def children_ancestry_level
      AncestryLevels::SECTION
    end

    def sections
      children.where ancestry_level: children_ancestry_level
    end
  end
end
