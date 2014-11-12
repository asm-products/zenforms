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

class Employee < ActiveRecord::Base
  belongs_to :company
end
