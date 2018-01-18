# frozen_string_literal: true

RSpec.describe FormulaRepository, '.find_formula_by' do
  let(:rule_json_array) do
    {
      'tax_rules' => [
        { min_income: 0, max_income: 18_200, base_tax: 0, tax_rate: 0 },
        { min_income: 18_201,  max_income: 37_000,  base_tax: 0,      tax_rate: 0.19 },
        { min_income: 37_001,  max_income: 87_000,  base_tax: 3572,   tax_rate: 0.325 },
        { min_income: 87_001,  max_income: 180_000, base_tax: 19_822, tax_rate: 0.37 },
        { min_income: 180_001, max_income: 'INF', base_tax: 54_232, tax_rate: 0.45 }
      ]
    }
  end

  subject { described_class.instance.find_formula_by(annual_salary) }

  before do
    allow(YAML).to receive(:load_file).and_return(rule_json_array)
  end

  context 'when annual salary is higher than the highest line' do
    let(:annual_salary) { 200_000 }

    it 'get correct formula from formulas' do
      expect(subject).to have_attributes(min_income: 180_001, max_income: Float::INFINITY, base_tax: 54_232, tax_rate: 0.45)
    end
  end
end
