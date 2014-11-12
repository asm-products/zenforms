# == Schema Information
#
# Table name: employees
#
#  id             :integer          not null, primary key
#  email_address  :string(255)
#  payment_amount :integer
#  company_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

FactoryGirl.define do
  factory :employee do
    email_address "MyString"
payment_amount 1
company_id 1
  end

end
