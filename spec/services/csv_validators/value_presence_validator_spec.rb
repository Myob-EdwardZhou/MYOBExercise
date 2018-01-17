RSpec.describe CSVValidator::ValuePresenceValidator, '#validate' do
  let(:input_csv) { CSVParser.new(csv_file_path) }

  subject { described_class.new(input_csv).validate }

  context 'with a csv file that miss a first name' do
    let(:csv_file_path) { 'spec/fixtures/validations/missing_first_name.csv' }

    it 'raise invalid CSV headers error' do
      expect { subject }.to raise_error(ValidateInputCSVException, 'missing_value')
    end
  end

  context 'with a csv file that miss a last name' do
    let(:csv_file_path) { 'spec/fixtures/validations/missing_last_name.csv' }

    it 'raise invalid CSV headers error' do
      expect { subject }.to raise_error(ValidateInputCSVException, 'missing_value')
    end
  end
end
