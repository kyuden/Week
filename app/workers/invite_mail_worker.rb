class InviteMailWorker
  include Sidekiq::Worker

  def perform(article_id)
    entries = Entry.where(
                    article_id: article_id,
                    cart_id:    nil
                  )
                  .includes([cart: :user])

    if entries.present?
      mail  = NoticeMailer.invite_notice(entries)
      mail.transport_encoding = "8bit"
      mail.deliver
    end
  end
end