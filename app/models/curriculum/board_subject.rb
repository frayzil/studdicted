class Curriculum::BoardSubject < ApplicationRecord
  belongs_to :board
  belongs_to :subject
end
