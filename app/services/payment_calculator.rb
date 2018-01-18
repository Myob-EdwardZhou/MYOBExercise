class PaymentCalculator
  class << self
    def calculate(name, annual_salary, super_rate, payment_start_date)
      formula = FormulaRepository.instance.find_formula(annual_salary)

      formula.generate_payslip(name, annual_salary, super_rate, payment_start_date)
    end
  end
end
