# frozen_string_literal: true

RSpec.describe CSVValidator::SuperRateValidator, '#validate!' do
  let(:input_csv) { CSVParser.new(csv_file_path) }

  subject { described_class.new(input_csv).validate! }

  context 'with a csv file has invalid annual salary format' do
    let(:csv_file_path) { 'spec/fixtures/validations/invalid_super_rate.csv' }

    it 'raise invalid annual salary format error' do
      expect { subject }.to raise_error(ValidateInputCSVException, 'invalid_super_rate_format')
    end
  end
end
