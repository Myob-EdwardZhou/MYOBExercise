# frozen_string_literal: true

require 'virtus'

class Formula
  include Virtus.model

  TWELVE_MONTH = 12

  attribute :min_income, Integer
  attribute :max_income, Float
  attribute :base_tax,   Integer
  attribute :tax_rate,   Float

  def max_income=(max_income)
    max_income == 'INF' ? super(Float::INFINITY) : super(max_income)
  end

  def generate_payslip(name, annual_salary, super_rate, payment_start_date)
    gross_income = calculate_gross_income_by(annual_salary)
    income_tax   = calculate_income_tax_by(annual_salary)
    net_income   = calculate_net_income_by(gross_income, income_tax)
    super_number = calculate_super_number_by(gross_income, super_rate)

    Payslip.new(
      name: name,
      gross_income: gross_income,
      income_tax: income_tax,
      net_income: net_income,
      super_number: super_number,
      payment_start_date: payment_start_date
    )
  end

  private

  def calculate_gross_income_by(annual_salary)
    (annual_salary / TWELVE_MONTH.to_f).floor
  end

  def calculate_income_tax_by(annual_salary)
    ((@base_tax + (annual_salary - @min_income) * @tax_rate) / TWELVE_MONTH.to_f).ceil
  end

  def calculate_net_income_by(gross_income, income_tax)
    gross_income - income_tax
  end

  def calculate_super_number_by(gross_income, super_rate)
    (gross_income * percentage_to_float(super_rate)).floor
  end

  def percentage_to_float(percentage)
    percentage.to_f / 100.0
  end
end
