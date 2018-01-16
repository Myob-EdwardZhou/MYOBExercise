RSpec.describe CSVValidator::PaymentStartDateValidator, '#validate' do
  let(:input_csv) { CSVParser.new(csv_file_path) }

  subject { described_class.new(input_csv).validate }

  context 'with a csv file that has a payment period start date is not the beginning of month' do
    let(:csv_file_path) { 'spec/fixtures/validations/invalid_payment_start_date.csv' }

    it 'raise invalid payment period error' do
      expect { subject }.to raise_error(ValidateInputCSVException, 'invalid_payment_period')
    end
  end

  context 'with a csv file that has an payment period end date is not the end of month' do
    let(:csv_file_path) { 'spec/fixtures/validations/invalid_payment_end_date.csv' }

    it 'raise invalid payment period error' do
      expect { subject }.to raise_error(ValidateInputCSVException, 'invalid_payment_period')
    end
  end

  context 'with a csv file that has a payment period is not a full month' do
    let(:csv_file_path) { 'spec/fixtures/validations/payment_period_not_full_month.csv' }

    it 'raise invalid payment period error' do
      expect { subject }.to raise_error(ValidateInputCSVException, 'invalid_payment_period')
    end
  end
end
