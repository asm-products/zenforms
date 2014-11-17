class NoticeMailer < ActionMailer::Base
  def notice_email(employee_id, token)
    @employee = Employee.find(employee_id)
    @token = token
    mail(to: @employee.email_address, subject: "Details needed for tax forms")
  end
end