# frozen_string_literal: true

class CSVValidator::SuperRateValidator
  SUPER_RATE_FORMAT = /\A\d+%\z/

  def initialize(input_csv)
    @input_csv = input_csv
  end

  def validate!
    raise ValidateInputCSVException, 'invalid_super_rate_format' unless annual_salary_format_valid?
  end

  private

  def annual_salary_format_valid?
    @input_csv.super_rates.all? { |super_rate| super_rate =~ SUPER_RATE_FORMAT }
  end
end
