class CSVValidator::HeaderValidator
  CSV_HEADERS = ['first name', 'last name', 'annual salary', 'super rate', 'payment start date']

  def initialize(input_csv)
    @input_csv = input_csv
  end

  def validate
    unless headers_name_valid? && headers_presence?
      raise ValidateInputCSVException, 'invalid_headers'
    end
  end

  private

  def headers_name_valid?
    @input_csv.headers == CSV_HEADERS
  end

  def headers_presence?
    !@input_csv.headers.include?(nil)
  end
end
