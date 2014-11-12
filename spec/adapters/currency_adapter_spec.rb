require 'rails_helper'
RSpec.describe CurrencyAdapter do
  describe '.dollar_string_to_cents' do
    it 'returns dollar value * 100' do
      expect(CurrencyAdapter.dollar_string_to_cents '342.11').to eq 34211
    end
  end
end