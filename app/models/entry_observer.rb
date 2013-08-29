class EntryObserver < ActiveRecord::Observer
  def after_create(entry)
    deliver_notify_cart(entry) if entry.cart_id
  end

  private
  def deliver_notify_cart(entry)
    mail = NoticeMailer.cart_notice(entry)
    mail.transport_encoding = "8bit"
    mail.deliver
  end
end
