class CSVValidator::AnnualSalaryValidator
  ANNUAL_SALARY_FORMAT = /\A\d+\z/

  def initialize(input_csv)
    @input_csv = input_csv
  end

  def validate
    unless annual_salary_format_valid?
      raise ValidateInputCSVException, 'invalid_annual_salary_format'
    end
  end

  private

  def annual_salary_format_valid?
    @input_csv.annual_salaries.all? { |annual_salary| annual_salary =~ ANNUAL_SALARY_FORMAT }
  end
end
