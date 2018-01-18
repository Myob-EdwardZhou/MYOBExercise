# frozen_string_literal: true

class CSVValidator::ValuePresenceValidator
  def initialize(input_csv)
    @input_csv = input_csv
  end

  def validate!
    raise ValidateInputCSVException, 'missing_value' unless all_values_present?
  end

  private

  def all_values_present?
    headers = @input_csv.headers

    @input_csv.entries.all? { |row| row.to_hash.values.compact.size == headers.size }
  end
end
