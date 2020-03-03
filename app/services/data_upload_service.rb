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
    board = Curriculum::Board.create_or_find_by(name: data['Board'])

    'too many errrors'
  end
end