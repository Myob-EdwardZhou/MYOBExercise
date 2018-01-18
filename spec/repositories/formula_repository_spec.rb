RSpec.describe FormulaRepository, '.find_formula' do
  let(:rule_json_array) do
    {
      'tax_rules' => [
        { min_income: 0,      max_income: 18200,  base_tax: 0,      tax_rate: 0 },
        { min_income: 18201,  max_income: 37000,  base_tax: 0,      tax_rate: 0.19 },
        { min_income: 37001,  max_income: 87000,  base_tax: 3572,   tax_rate: 0.325 },
        { min_income: 87001,  max_income: 180000, base_tax: 19822,  tax_rate: 0.37 },
        { min_income: 180001, max_income: 'INF',  base_tax: 54232,  tax_rate: 0.45 }
      ]
    }
  end

  subject { described_class.instance.find_formula(annual_salary) }

  before do
    allow(YAML).to receive(:load_file).and_return(rule_json_array)
  end

  context 'when annual salary is higher than the highest line' do
    let(:annual_salary) { 200000 }

    it 'get correct formula from formulas' do
      expect(subject).to have_attributes(min_income: 180001, max_income: Float::INFINITY, base_tax: 54232, tax_rate: 0.45)
    end
  end
end
