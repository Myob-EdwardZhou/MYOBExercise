# frozen_string_literal: true

RSpec.describe CSVParser do
  let(:csv_file_path) { 'spec/fixtures/employee_salary.csv' }
  let(:input_csv) { described_class.new(csv_file_path) }

  describe '#map_to_employees' do
    subject(:employees) { input_csv.map_to_employees }

    describe 'first employee' do
      subject { employees.first }

      it { is_expected.to be_a Employee }
      it { is_expected.to have_attributes(first_name: 'David', last_name: 'Rudd', annual_salary: 60_050, super_rate: '9%', payment_start_date: '01 March - 31 March') }
    end

    describe 'second employee' do
      subject { employees.second }

      it { is_expected.to be_a Employee }
      it { is_expected.to have_attributes(first_name: 'Ryan', last_name: 'Chen', annual_salary: 120_000, super_rate: '10%', payment_start_date: '01 March - 31 March') }
    end
  end

  describe '#headers' do
    subject { input_csv.headers }

    it { is_expected.to eq ['first name', 'last name', 'annual salary', 'super rate', 'payment start date'] }
  end

  describe 'first_names' do
    subject { input_csv.first_names }

    it { is_expected.to eq %w[David Ryan] }
  end

  describe 'last_names' do
    subject { input_csv.last_names }

    it { is_expected.to eq %w[Rudd Chen] }
  end

  describe 'annual_salaries' do
    subject { input_csv.annual_salaries }

    it { is_expected.to eq %w[60050 120000] }
  end

  describe 'super_rates' do
    subject { input_csv.super_rates }

    it { is_expected.to eq %w[9% 10%] }
  end

  describe 'payment_start_dates' do
    subject { input_csv.payment_start_dates }

    it { is_expected.to eq ['01 March - 31 March', '01 March - 31 March'] }
  end
end
