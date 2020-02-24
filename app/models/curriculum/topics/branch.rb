module Curriculum
  module Topics
    class Branch < ::Curriculum::Topic
      delegate :board, to: :subject

    end
  end
end
