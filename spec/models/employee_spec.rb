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

require 'rails_helper'

describe Employee do
  it "should save if all fields are valid" do
    create(:employee)
    expect(Employee.count).to eq 1
  end
  it "should create a queue item in sidekiq" do
    create(:employee)
    expect(SendNoticeWorker.jobs.size).to eq 1
  end
end
