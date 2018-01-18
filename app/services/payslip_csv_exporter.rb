# frozen_string_literal: true

class PayslipCSVExporter
  OUTPUT_CSV_HEADER = ['name', 'pay period', 'gross income', 'income tax', 'net income', 'super'].freeze
  OUTPUT_CSV_PATH = "#{Monkeyking.project_root}/output/payslips.csv"

  def initialize(payslips)
    @payslips = payslips
  end

  def export
    CSV.open(OUTPUT_CSV_PATH, 'wb') do |csv|
      csv << OUTPUT_CSV_HEADER

      @payslips.each do |payslip|
        csv << payslip.to_csv_row
      end
    end
  end

  private

  def file_name(format = 'csv')
    "#{Monkeyking.project_root}/output/#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}.#{format}"
  end
end
