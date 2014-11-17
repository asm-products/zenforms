class Notice < ActiveRecord::Base
  belongs_to :employee
  before_create :generate_token_and_create_email

  private
  def generate_token_and_create_email
    self.token = SecureRandom.urlsafe_base64
    self.job_id = SendNoticeWorker.perform_async(self.employee_id, self.token)
  end
end