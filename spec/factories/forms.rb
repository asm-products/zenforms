FactoryGirl.define do
  factory :form do
    ssn Faker::Medical::SSN.ssn
    name Faker::Name.name
    address_street Faker::Address.street_address
    address_city Faker::Address.city
    address_state Faker::Address.state
    address_zip Faker::Address.zip
    phone "555.555.5555"
    employee
  end
end