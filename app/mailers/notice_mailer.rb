class NoticeMailer < ActionMailer::Base
  default :from => "Week<week.no.reply@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.cart_notice.subject
  #
  def cart_notice(entry)
    mail to:          entry.cart.user.email,
         from:        ENV['GMAIL_DISPLAY'],
         return_path: ENV['GMAIL_ADDRESS'],
         subject:     "参加者通知メール"
  end
end
