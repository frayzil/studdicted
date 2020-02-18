module Curriculum
  module Topics
    class Topic < ::Curriculum::Topic
      delegate :board, to: :topic_chunk
    end
  end
end
