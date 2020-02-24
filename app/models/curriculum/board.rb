# frozen_string_literal: true

class Curriculum::Board < ApplicationRecord
  has_many :board_subjects,
           dependent: :destroy

  has_many :subjects,
           through: :board_subjects
end
