# frozen_string_literal: true

require 'bigdecimal'

module StringHelper
  def percentage_to_float(percentage)
    (BigDecimal(percentage) / 100).to_f
  end
end
