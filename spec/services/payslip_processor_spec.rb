RSpec.describe PayslipProcessor, "#run" do
  let(:input_csv) { double(:input_csv) }

  subject { described_class.new(input_csv).run }

  describe 'validate input csv and generate result csv' do
    let(:csv_data)      { double(:csv_data) }
    let(:csv_validator) { double(:csv_validator) }
    let(:csv_generator) { double(:csv_generator) }

    before do
      allow(CSVParser).to receive(:new).with(input_csv).and_return(csv_data)
      allow(CSVValidator).to receive(:new).with(csv_data).and_return(csv_validator)
      allow(csv_validator).to receive(:validate)
      expect(PayslipCSVGenerator).to receive(:new).with(csv_data).and_return(csv_generator)
    end

    it 'call generate method on csv generator' do
      expect(csv_generator).to receive(:generate)

      subject
    end
  end
end
