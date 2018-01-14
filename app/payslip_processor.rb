class PayslipProcessor
  def initialize(payment_csv)
    @csv_file = payment_csv
  end

  def run
    csv_data = CSVParser.new(@csv_file)
  end
end
