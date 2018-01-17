class PayslipCSVGenerator
  OUTPUT_CSV_PATH   = "#{Monkeyking.project_root}/output/pay_slip.csv".freeze
  OUTPUT_CSV_HEADER = ['name', 'pay period', 'gross income', 'income tax', 'net income', 'super'].freeze

  def initialize(csv_data)
    @csv_data = csv_data
  end

  def generate
    CSV.open(OUTPUT_CSV_PATH, 'wb') do |csv|
      csv << OUTPUT_CSV_HEADER

      @csv_data.map_to_employees.each do |employee|
        pay_slip = PaymentCalculator.calculate(employee.name, employee.annual_salary, employee.super_rate, employee.payment_start_date)

        csv << [pay_slip.name, pay_slip.payment_start_date, pay_slip.gross_income, pay_slip.income_tax, pay_slip.net_income, pay_slip.super_number]
      end
    end
  end
end
