class DataUploadService
  attr_accessor :file

  FILE_PATH = 'tmp/data_upload.csv'

  def initialize(file=nil)
    @file = file

    super()
  end

  def execute
    CSV.open(FILE_PATH, "wb") do |csv|
      csv << ["animal", "count", "price"]
      csv << ["animal", "count", "price"]
      csv << ["fox", "1", "$90.00"]
    end

    FILE_PATH
  end
  
  # The only method required to use the f.submit helper.
  def persisted? 
    false
  end
end