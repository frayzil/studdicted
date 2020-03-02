# frozen_string_literal: true

module Curriculum
  class Subject < ::Curriculum::Topic
    has_one :board_subject,
            dependent: :destroy
    has_one :board, through: :board_subject

    def children_ancestroy_level
      AncestryLevels::BRANCH
    end

    def branches
      children.where ancestry_level: children_ancestroy_level
    end
  end
end
