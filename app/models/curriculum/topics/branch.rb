module Curriculum
  module Topics
    class Branch < ::Curriculum::Topic
      delegate :board, to: :subject

      def chapters
        children.where ancestry_level: AncestryLevels::CHAPTER
      end
    end
  end
end
