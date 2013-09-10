class OwnerMailer < ActionMailer::Base
  default :from => "Week<week.no.reply@gmail.com>"
  def detail_mail(entries)
    @entries = entries

    users_adress = []
    entries.each do |entry|
     users_adress  << entry.cart.user.email
    end

    mail bcc:         users_adress,
         from:        ENV['GMAIL_DISPLAY'],
         return_path: ENV['GMAIL_ADDRESS'],
         subject:     "イベント詳細メール"
  end
end
