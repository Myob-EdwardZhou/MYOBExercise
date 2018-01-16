class CSVValidator::SuperRateValidator
  SUPER_RATE_FORMAT = /\A\d+%\z/

  def initialize(input_csv)
    @input_csv = input_csv
  end

  def validate
    unless annual_salary_format_valid?
      raise ValidateInputCSVException, 'invalid_super_rate_format'
    end
  end

  private

  def annual_salary_format_valid?
    @input_csv.super_rates.all? { |super_rate| super_rate =~ SUPER_RATE_FORMAT }
  end
end
