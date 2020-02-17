# frozen_string_literal: true

class Curriculum::Board < ApplicationRecord
  has_and_belongs_to_many :subjects,
                          class_name: 'Topic',
                          join_table: :curriculum_board_subjects,
                          foreign_key: :board_id,
                          association_foreign_key: :subject_id
end
