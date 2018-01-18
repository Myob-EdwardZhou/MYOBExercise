# frozen_string_literal: true

class PayslipService
  class << self
    def payslip_for(employee)
      formula = FormulaRepository.instance.find_formula_by(employee.annual_salary)

      formula.generate_payslip(employee.name, employee.annual_salary, employee.super_rate, employee.payment_start_date)
    end
  end
end
