# frozen_string_literal: true

module Curriculum
  class Chapter < ::Curriculum::Topic
    delegate :board, to: :branch

    def children_ancestroy_level
      AncestryLevels::SECTION
    end

    def sections
      children.where ancestry_level: children_ancestroy_level
    end
  end
end
