RSpec.describe CSVValidator do
  describe '#validate' do
    let(:header_validator)              { double(:header_validator) }
    let(:value_presence_validator)      { double(:value_presence_validator) }
    let(:annual_salary_validator)       { double(:annual_salary_validator) }
    let(:super_rate_validator)          { double(:super_rate_validator) }
    let(:payment_start_date_validator)  { double(:payment_start_date_validator) }
    let(:input_csv)                     { double(:input_csv) }

    subject { described_class.new(input_csv).validate }

    before do
      allow(CSVValidator::HeaderValidator).to receive(:new)
        .with(input_csv).and_return(header_validator)
      allow(header_validator).to receive(:validate)

      allow(CSVValidator::ValuePresenceValidator).to receive(:new)
        .with(input_csv).and_return(value_presence_validator)
      allow(value_presence_validator).to receive(:validate)

      allow(CSVValidator::AnnualSalaryValidator).to receive(:new)
        .with(input_csv).and_return(annual_salary_validator)
      allow(annual_salary_validator).to receive(:validate)

      allow(CSVValidator::SuperRateValidator).to receive(:new)
        .with(input_csv).and_return(super_rate_validator)
      allow(super_rate_validator).to receive(:validate)

      allow(CSVValidator::PaymentStartDateValidator).to receive(:new)
        .with(input_csv).and_return(payment_start_date_validator)
      allow(payment_start_date_validator).to receive(:validate)
    end

    it 'validate headers' do
      expect(header_validator).to receive(:validate)

      subject
    end

    it 'validate value presence' do
      expect(value_presence_validator).to receive(:validate)

      subject
    end

    it 'validate annual salary' do
      expect(annual_salary_validator).to receive(:validate)

      subject
    end

    it 'validate super rate' do
      expect(super_rate_validator).to receive(:validate)

      subject
    end

    it 'validate payment start date' do
      expect(payment_start_date_validator).to receive(:validate)

      subject
    end
  end
end
