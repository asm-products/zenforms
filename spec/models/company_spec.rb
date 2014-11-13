# == Schema Information
#
# Table name: companies
#
#  id             :integer          not null, primary key
#  ein            :string(255)
#  name           :string(255)
#  user_id        :integer
#  address_street :string(255)
#  address_city   :string(255)
#  address_state  :string(255)
#  address_zip    :string(255)
#

require 'rails_helper'

describe Company do
  it "should save if all fields are valid" do
    create(:company)
    expect(Company.count).to eq 1
  end
  it "should not save if zip code is invalid" do
    company = build(:company, address_zip: "1234")
    company.save
    expect(Company.count).to eq 0
  end
  it "should not save if EIN is invalid" do
    company = build(:company, ein: "1234")
    company.save
    expect(Company.count).to eq 0
  end
end
