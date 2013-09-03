class MailWorker
  include Sidekiq::Worker

  def perform(entry_id)
    entry = Entry.find(entry_id)
    mail  = NoticeMailer.cart_notice(entry)
    mail.transport_encoding = "8bit"
    mail.deliver
  end
end