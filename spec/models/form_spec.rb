require 'rails_helper'

describe Form do
  it "should save if all fields are valid" do
    create(:form)
    expect(Form.count).to eq 1
  end
  it "should not save if zip code is invalid" do
    form = build(:form, address_zip: "1234")
    form.save
    expect(Form.count).to eq 0
  end
  it "should not save if SSN is invalid" do
    form = build(:form, ssn: "1234")
    form.save
    expect(Form.count).to eq 0
  end
  it "should not save if phone number is invalid" do
    form = build(:form, phone: "12345")
    form.save
    expect(Form.count).to eq 0
  end
end