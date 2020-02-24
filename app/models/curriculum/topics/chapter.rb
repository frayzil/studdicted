module Curriculum
  module Topics
    class Chapter < ::Curriculum::Topic
      delegate :board, to: :branch

      def sections
        children.where ancestry_level: AncestryLevels::SECTION
      end
    end
  end
end
