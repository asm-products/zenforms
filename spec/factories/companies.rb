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

FactoryGirl.define do
  factory :company do
    ein Faker::Company.ein
    name Faker::Name.name
    address_street Faker::Address.street_address
    address_city Faker::Address.city
    address_state Faker::Address.state
    address_zip Faker::Address.zip
    user
  end
end
