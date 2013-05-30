class Notice < ActionMailer::Base
  default from: "msmsms.um@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice.all_notice.subject
  #
  def all_notice
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
