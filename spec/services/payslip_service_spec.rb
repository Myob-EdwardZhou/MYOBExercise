# frozen_string_literal: true

RSpec.describe PayslipService, '.payslip_for' do
  let(:employee)      { double(:employee, name: 'employee', annual_salary: 10_000, super_rate: '9%', payment_start_date: '01 March - 31 March') }
  let(:formula)       { double(:formula) }

  subject { described_class.payslip_for(employee) }

  before do
    allow(FormulaRepository.instance).to receive(:find_formula_by).with(employee.annual_salary).and_return(formula)
  end

  it 'call generate_payslip method on formula' do
    expect(formula).to receive(:generate_payslip).with(employee.name, employee.annual_salary, employee.super_rate, employee.payment_start_date)

    subject
  end
end
