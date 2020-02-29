class CreateKnowledgeConcepts < ActiveRecord::Migration[6.0]
  def change
    create_table :knowledge_concepts do |t|
      t.string :title, index: { unique: true }
      t.text :description

      t.timestamps
    end
  end
end
