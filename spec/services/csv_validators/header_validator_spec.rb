RSpec.describe CSVValidator::HeaderValidator, '#validate' do
  let(:input_csv) { CSVParser.new(csv_file_path) }

  subject { described_class.new(input_csv).validate }

  context 'with a csv file that has a invalid header' do
    let(:csv_file_path) { 'spec/fixtures/validations/invalid_header_name.csv' }

    it 'raise invalid CSV headers error' do
      expect { subject }.to raise_error(ValidateInputCSVException, 'invalid_headers')
    end
  end

  context 'with a csv file that has an empty header' do
    let(:csv_file_path) { 'spec/fixtures/validations/missing_headers.csv' }

    it 'raise invalid CSV headers error' do
      expect { subject }.to raise_error(ValidateInputCSVException, 'invalid_headers')
    end
  end
end
