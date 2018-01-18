RSpec.describe PaymentCalculator, '.calculate' do
  let(:name)                { double(:name) }
  let(:annual_salary)       { double(:annual_salary) }
  let(:super_rate)          { double(:super_rate) }
  let(:payment_start_date)  { double(:payment_start_date) }
  let(:formula)             { double(:formula) }

  subject { described_class.calculate(name, annual_salary, super_rate, payment_start_date) }

  before do
    allow(FormulaRepository.instance).to receive(:find_formula).with(annual_salary).and_return(formula)
  end

  it 'call generate_payslip method on formula' do
    expect(formula).to receive(:generate_payslip).with(name, annual_salary, super_rate, payment_start_date)

    subject
  end
end
