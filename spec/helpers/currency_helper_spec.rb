require 'rails_helper'

RSpec.describe CurrencyHelper, type: :helper do
  describe '.dollar_string_to_cents' do
    it 'returns dollar value * 100' do
      expect(helper.dollar_string_to_cents '342.11').to eq 34211
    end
  end
end
