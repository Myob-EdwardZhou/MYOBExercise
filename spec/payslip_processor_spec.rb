RSpec.describe PayslipProcessor, "#run" do
  let(:csv) { double(:csv) }

  subject { described_class.new(csv).run }

  it 'parse input csv file' do
    expect(CSVParser).to receive(:new).with(csv)

    subject
  end
end
