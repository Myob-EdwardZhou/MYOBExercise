# frozen_string_literal: true

RSpec.describe 'employee pay slip csv' do
  let(:employees_salary_csv_file) { 'spec/integration/employee_salary.csv' }
  let(:expected_csv) do
    [
      ['name', 'pay period', 'gross income', 'income tax', 'net income', 'super'],
      ['David Rudd', '01 March - 31 March', '5004', '922', '4082', '450'],
      ['Ryan Chen', '01 March - 31 March', '10000', '2669', '7331', '1000']
    ]
  end

  subject { PayslipProcessor.new(employees_salary_csv_file).run }

  it 'output correct payslip csv file' do
    stub_const("PayslipCSVExporter::OUTPUT_CSV_PATH", 'spec/integration/payslips.csv')

    subject

    output_csv = CSV.read('spec/integration/payslips.csv')

    expect(output_csv).to eq expected_csv
  end
end
