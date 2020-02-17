module Curriculum
  module Topics
    class TopicChunk < ::Curriculum::Topic
      delegate :board, to: :subject

    end
  end
end
