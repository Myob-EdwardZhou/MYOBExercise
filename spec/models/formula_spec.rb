# frozen_string_literal: true

RSpec.describe Formula do
  describe '#generate_payslip' do
    let(:formula)             { Formula.new(min_income: 37_001, max_income: 87_000, base_tax: 3572, tax_rate: 0.325) }
    let(:name)                { double(:name) }
    let(:annual_salary)       { 60_050 }
    let(:super_rate)          { '9%' }
    let(:payment_start_date)  { '1 March - 31 March' }

    subject { formula.generate_payslip(name, annual_salary, super_rate, payment_start_date) }

    it 'generate a payslip object with correct attributes' do
      expect(Payslip).to receive(:new).with(name: name, gross_income: 5004, income_tax: 922, net_income: 4082, super_number: 450, pay_period: '1 March - 31 March')

      subject
    end
  end
end
