RSpec.describe PayslipProcessor, "#run" do
  let(:input_csv) { double(:input_csv) }

  subject { described_class.new(input_csv).run }

  describe 'validate csv file' do
    let(:csv_data)      { double(:csv_data) }
    let(:csv_validator) { double(:csv_validator) }

    before do
      allow(CSVParser).to receive(:new).with(input_csv).and_return(csv_data)
      allow(CSVValidator).to receive(:new).with(csv_data).and_return(csv_validator)
    end

    it 'call validate method on csv validator' do
      expect(csv_validator).to receive(:validate)

      subject
    end
  end
end
