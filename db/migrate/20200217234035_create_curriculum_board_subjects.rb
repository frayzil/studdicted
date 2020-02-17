class CreateCurriculumBoardSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_board_subjects do |t|
      t.belongs_to :board, null: false, foreign_key: { to_table: :curriculum_boards }
      t.belongs_to :subject, null: false, foreign_key: { to_table: :curriculum_topics }

      t.timestamps
    end
  end
end
