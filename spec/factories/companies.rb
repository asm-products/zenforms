FactoryGirl.define do
  factory :company do
    ein Faker::Company.ein
    name Faker::Company.name
    address_street Faker::Address.street_address
    address_city Faker::Address.city
    address_state Faker::Address.state
    address_zip Faker::Address.zip
    user
  end
end