require 'active_support/all'

class CSVValidator::PaymentStartDateValidator
  def initialize(input_csv)
    @input_csv = input_csv
  end

  def validate
    unless start_date_is_valid? && end_date_is_valid? && payment_period_is_full_month?
      raise ValidateInputCSVException, 'invalid_payment_period'
    end
  end

  private

  def start_date_of(period)
    period.split('-').first
  end

  def end_date_of(period)
    period.split('-').last
  end

  def start_date_is_valid?
    @input_csv.payment_start_dates.all? do |payment_start_date|
      start_date = Date.parse(start_date_of(payment_start_date))
      start_date == start_date.beginning_of_month
    end
  end

  def end_date_is_valid?
    @input_csv.payment_start_dates.all? do |payment_start_date|
      end_date = Date.parse(end_date_of(payment_start_date))
      end_date == end_date.end_of_month
    end
  end

  def payment_period_is_full_month?
    @input_csv.payment_start_dates.all? do |payment_start_date|
      start_date = Date.parse(start_date_of(payment_start_date))
      end_date = Date.parse(end_date_of(payment_start_date))

      start_date.month == end_date.month
    end
  end
end
