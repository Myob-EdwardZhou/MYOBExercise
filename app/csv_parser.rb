require 'csv'

class CSVParser
  def initialize(csv_file)
    @csv = CSV.read(csv_file, headers: true)
  end
end
