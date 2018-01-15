RSpec.describe PayslipProcessor, "#run" do
  let(:csv) { double(:csv) }

  subject { described_class.new(csv).run }

  it 'parse input csv file' do
    expect(CSVParser).to receive(:new).with(csv)

    subject
  end

  describe 'validate csv file' do
    let(:csv_data)      { double(:csv_data) }
    let(:csv_validator) { double(:csv_validator) }

    before do
      allow(CSVParser).to receive(:new).with(csv).and_return(csv_data)
      allow(CSVValidator).to receive(:new).with(csv_data).and_return(csv_validator)
    end

    it 'call validate method on csv validator' do
      expect(csv_validator).to receive(:validate)

      subject
    end
  end
end
