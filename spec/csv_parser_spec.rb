RSpec.describe CSVParser do
  let(:csv_file_path) { 'employee_pay_slip.csv' }
  let(:input_csv) { described_class.new(csv_file_path) }

  describe '#map_to_employee' do
    subject { input_csv.map_to_employee }

    it { is_expected.to eq [{ first_name: 'David', last_name: 'Rudd', annual_salary: '60050',  super_rate: '9%',  payment_start_date: '01 March - 31 March' },
                            { first_name: 'Ryan',  last_name: 'Chen', annual_salary: '120000', super_rate: '10%', payment_start_date: '01 March - 31 March' }] }
  end

  describe '#headers' do
    subject { input_csv.headers }

    it { is_expected.to eq ['first name', 'last name', 'annual salary', 'super rate', 'payment start date'] }
  end

  describe 'first_names' do
    subject { input_csv.first_names }

    it { is_expected.to eq ['David', 'Ryan'] }
  end

  describe 'last_names' do
    subject { input_csv.last_names }

    it { is_expected.to eq ['Rudd', 'Chen'] }
  end

  describe 'annual_salaries' do
    subject { input_csv.annual_salaries }

    it { is_expected.to eq ['60050', '120000'] }
  end

  describe 'super_rates' do
    subject { input_csv.super_rates }

    it { is_expected.to eq ['9%', '10%'] }
  end

  describe 'payment_start_dates' do
    subject { input_csv.payment_start_dates }

    it { is_expected.to eq ['01 March - 31 March', '01 March - 31 March'] }
  end
end
