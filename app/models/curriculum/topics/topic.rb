module Curriculum
  module Topics
    class Topic < ::Curriculum::Topic
      delegate :board, to: :branch
    end
  end
end
