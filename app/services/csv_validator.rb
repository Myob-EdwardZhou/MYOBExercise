# frozen_string_literal: true

class CSVValidator
  VALIDATORS = %w[
    HeaderValidator
    ValuePresenceValidator
    AnnualSalaryValidator
    PaymentStartDateValidator
    SuperRateValidator
  ].freeze

  def initialize(input_csv)
    @input_csv = input_csv
  end

  def validate
    validators.each(&:validate!)
  end

  private

  def validators
    VALIDATORS.map do |name|
      CSVValidator.const_get(name).new(@input_csv)
    end
  end
end
