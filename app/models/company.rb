class Company < ActiveRecord::Base
  belongs_to :user
  validates_format_of :address_zip, :with => /\A\d{5}(-\d{4})?\z/, :message => "should be in the form 12345 or 12345-1234"
  validates_format_of :ein, :with => /[0-9]{2}-[0-9]{7}/, :message => "should be in the form of 12-1234567"
  validates_presence_of :ein, :name, :address_street, :address_city, :address_zip, :address_state, :user
end