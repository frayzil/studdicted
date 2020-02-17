module Curriculum
  module Topics
    class SubTopic < ::Curriculum::Topic
      delegate :board, to: :topic

    end
  end
end
