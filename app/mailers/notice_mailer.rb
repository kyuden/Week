class NoticeMailer < ActionMailer::Base
  default :from => "Week<week.no.reply@gmail.com>"

  #call EntryObserver
  def cart_notice(entry)
    @entry = entry
    mail to:          entry.article.user.email,
         from:        ENV['GMAIL_DISPLAY'],
         return_path: ENV['GMAIL_ADDRESS'],
         subject:     "参加通知メール"
  end
  def invite_notice(entries)
    @entries = entries

    users_adress = []
    entries.each do |entry|
      users_adress << entry.watch.user.email
    end

    mail bcc:         users_adress,
         from:        ENV['GMAIL_DISPLAY'],
         return_path: ENV['GMAIL_ADDRESS'],
         subject:     "参加者募集メール"
  end
end
