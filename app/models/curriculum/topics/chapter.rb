module Curriculum
  module Topics
    class Chapter < ::Curriculum::Topic
      delegate :board, to: :branch
    end
  end
end
