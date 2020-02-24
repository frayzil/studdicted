module Curriculum
  module Topics
    class Subject < ::Curriculum::Topic
      has_one :board_subject,
              dependent: :destroy
      has_one :board, through: :board_subject

      def branches
        children.where ancestry_level: AncestryLevels::BRANCH
      end
    end
  end
end
