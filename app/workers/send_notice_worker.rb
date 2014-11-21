class SendNoticeWorker
  include Sidekiq::Worker

  def perform(employee_id, token)
    NoticeMailer.notice_email(employee_id, token).deliver!
  end
end