class OwnerMailer < ActionMailer::Base
  default :from => "Week<week.no.reply@gmail.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.owner_mailer.detail_notice.subject
  #
  def detail_mail(entries)
    @entries = entries

    users_adress = []
    entries.each do |entry|
     users_adress  << entry.cart.user.email
    end

    mail :bcc => users_adress,
         from: "Week<week.no.reply@gmail.com>",
         return_path: "week.no.reply@gmail.com",
         subject: "イベント詳細メール"
  end
end
