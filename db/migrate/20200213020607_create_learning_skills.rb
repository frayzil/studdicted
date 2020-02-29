class CreateLearningSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_skills do |t|
      t.string :body, index: { unique: true }
      t.text :description

      t.timestamps
    end
  end
end
