require 'csv'
require 'active_support/all'

class CSVParser
  ROW_INDICES = {
    first_name: 0,
    last_name: 1,
    annual_salary: 2,
    super_rate: 3,
    payment_start_date: 4
  }.freeze

  def initialize(csv_file)
    @csv = CSV.read(csv_file, headers: true)
  end

  def map_to_employee
    @csv.map do |row|
      {
        first_name:         row[ROW_INDICES[:first_name]],
        last_name:          row[ROW_INDICES[:last_name]],
        annual_salary:      row[ROW_INDICES[:annual_salary]],
        super_rate:         row[ROW_INDICES[:super_rate]],
        payment_start_date: row[ROW_INDICES[:payment_start_date]]
      }
    end
  end

  def headers
    @csv.headers
  end

  %w(first_names last_names annual_salaries super_rates payment_start_dates).map do |method_name|
    define_method method_name do
      @csv.map { |row| row[ROW_INDICES[method_name.singularize.to_sym]] }
    end
  end
end
