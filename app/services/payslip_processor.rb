class PayslipProcessor
  def initialize(input_csv)
    @csv_data = CSVParser.new(input_csv)
  end

  def run
    CSVValidator.new(@csv_data).validate

    PayslipCSVGenerator.new(@csv_data).generate
  end
end
