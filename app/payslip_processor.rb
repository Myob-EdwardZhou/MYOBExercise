class PayslipProcessor
  def initialize(input_csv)
    @csv_data = CSVParser.new(input_csv)
  end

  def run
    CSVValidator.new(@csv_data).validate
    # operator.operate(@csv_data)
  end
end
