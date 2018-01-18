# frozen_string_literal: true

require 'singleton'
require 'yaml'

class FormulaRepository
  include Singleton

  def find_formula_by(annual_salary)
    formulas.find { |formula| annual_salary >= formula.min_income && annual_salary <= formula.max_income }
  end

  private

  def formulas
    rule_json_array = YAML.load_file(Monkeyking.project_root.join('config/tax_rules.yml'))['tax_rules']
    rule_json_array.map { |rule| Formula.new(rule) }
  end
end
