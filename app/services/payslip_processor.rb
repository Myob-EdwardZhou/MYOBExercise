# frozen_string_literal: true

class PayslipProcessor
  def initialize(input_csv)
    @csv_data = CSVParser.new(input_csv)
  end

  def run
    CSVValidator.new(@csv_data).validate

    payslips = @csv_data.map_to_employees.map { |employee| PayslipService.payslip_for(employee) }

    PayslipCSVExporter.new(payslips).export
  end
end
