require 'csv'

class DataUploadService
  attr_accessor :file

  FILE_PATH = 'tmp/data_upload.csv'

  def initialize(file=nil)
    @file = file

    super()
  end

  def execute
    CSV.open(FILE_PATH, 'wb') do |new_file|
      header_added = false

      CSV.foreach(file, headers: true) do |data_row|

        unless header_added
          header = data_row.to_h.keys
          header << 'Errors in upload'
          new_file << header
          header_added = true
        end

        data_hash = data_row.to_h
        new_row = data_hash.values
        new_row << write(data_hash)
        new_file << new_row
      end
    end

    FILE_PATH
  end
  
  # The only method required to use the f.submit helper.
  def persisted? 
    false
  end

  private

  def write(data)
    board = Curriculum::Board.create_or_find_by!(name: data['Board'])

    subject = board.subjects.find_or_create_by!(title: data['Subject'])

    branch = subject.branches.find_or_create_by!(title: data['Branch'])

    chapter = branch.chapters.find_or_create_by!(title: data['Chapter'])

    section = chapter.sections.find_or_create_by!(title: data['Section'])

    skill = Learning::Skill.create_or_find_by!(body: data['Skill'])

    section.learning_skills << skill

    concept_titles = data['Concept(s)'].split(',').collect(&:strip)

    concept_titles.each do |title|
      concept = Knowledge::Concept.create_or_find_by!(title: title)
      skill.knowledge_concepts << concept
    end

    ''
  rescue Exception => e
    e
  end
end
