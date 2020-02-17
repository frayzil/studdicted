class CreateCurriculumTopics < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE curriculum_topic_ancestry_level AS ENUM (
        'subject', 'topic_chunk', 'topic', 'sub_topic'
      );
    SQL

    create_table :curriculum_topics do |t|
      t.string :title
      t.text :description
      t.column :ancestry_level, :curriculum_topic_ancestry_level, null: false
      t.string :ancestry, index: true

      t.timestamps
    end
  end

  def down
    drop_table :curriculum_topics

    execute <<-SQL
      DROP TYPE curriculum_topic_ancestry_level;
    SQL
  end
end
