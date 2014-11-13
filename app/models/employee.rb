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

  validates :email_address, presence: true, uniqueness: { scope: [:company_id] }
  validates :payment_amount, presence: true

  def payment_amount_money
    Money.new(payment_amount || 0).format
  end
end
