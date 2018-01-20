# frozen_string_literal: true

require 'virtus'

class Payslip
  include Virtus.value_object

  attribute :name,                String
  attribute :pay_period,  String
  attribute :gross_income,        Integer
  attribute :income_tax,          Integer
  attribute :net_income,          Integer
  attribute :super_number,        Integer

  def to_csv_row
    [@name, @pay_period, @gross_income, @income_tax, @net_income, @super_number]
  end
end
