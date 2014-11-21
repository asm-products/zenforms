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

class Company < ActiveRecord::Base
  belongs_to :user
  validates_format_of :address_zip, :with => /\A\d{5}(-\d{4})?\z/, :message => "should be in the form 12345 or 12345-1234"
  validates_format_of :ein, :with => /[0-9]{2}-[0-9]{7}/, :message => "should be in the form of 12-1234567"
  validates_presence_of :ein, :name, :address_street, :address_city, :address_zip, :address_state, :user
  has_many :employees
end
