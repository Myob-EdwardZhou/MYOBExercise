require 'virtus'

class Employee
  include Virtus.value_object

  attribute :first_name,          String
  attribute :last_name,           String
  attribute :annual_salary,       Integer
  attribute :super_rate,          Float
  attribute :payment_start_date,  String

  def name
    "#{@first_name} #{@last_name}"
  end
end
