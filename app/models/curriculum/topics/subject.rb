module Curriculum
  module Topics
    class Subject < ::Curriculum::Topic
      has_one :board_subject
      has_one :board, through: :board_subject
    end
  end
end
