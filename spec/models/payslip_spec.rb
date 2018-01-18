# frozen_string_literal: true

RSpec.describe Payslip do
  let(:payslip) { Payslip.new(name: 'Li', payment_start_date: '01 March - 31 March', gross_income: 1000, income_tax: 1, net_income: 999, super_number: 1000) }

  describe '#to_csv_row' do
    subject { payslip.to_csv_row }

    it { is_expected.to eq [payslip.name, payslip.payment_start_date, payslip.gross_income, payslip.income_tax, payslip.net_income, payslip.super_number] }
  end
end
