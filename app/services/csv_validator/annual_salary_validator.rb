# frozen_string_literal: true

class CSVValidator::AnnualSalaryValidator
  ANNUAL_SALARY_FORMAT = /\A\d+\z/

  def initialize(input_csv)
    @input_csv = input_csv
  end

  def validate!
    raise ValidateInputCSVException, 'invalid_annual_salary_format' unless annual_salary_format_valid?
  end

  private

  def annual_salary_format_valid?
    @input_csv.annual_salaries.all? { |annual_salary| annual_salary =~ ANNUAL_SALARY_FORMAT }
  end
end
