class Curriculum::BoardSubject < ApplicationRecord
  belongs_to :board
  belongs_to :subject,
             class_name: 'Curriculum::Topics::Subject'
end
