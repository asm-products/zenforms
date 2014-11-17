class Form < ActiveRecord::Base
  belongs_to :employee
  validates_format_of :address_zip, :with => /\A\d{5}(-\d{4})?\z/, :message => "should be in the form 12345 or 12345-1234"
  validates_format_of :ssn, :with => /\A[0-9]{3}-[0-9]{2}-[0-9]{4}\z/, :message => "should be in the form of 123-12-1234"
  phony_normalize :phone, :default_country_code => 'US'
  validates_plausible_phone :phone, :normalized_country_code => 'US'
  validates_presence_of :ssn, :name, :address_street, :address_city, :address_zip, :address_state, :employee, :phone
end