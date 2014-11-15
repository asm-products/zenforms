module CurrencyHelper
  def dollar_string_to_cents(dollar_string)
    dollar_string.gsub(/[^\d\.]/, '').to_f * 100
  end
end
