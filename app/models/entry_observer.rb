class EntryObserver < ActiveRecord::Observer
  def after_create(entry)
    deliver_notify_cart(entry) if entry.cart_id && entry.count_entry_cart != 1
  end

  private
  def deliver_notify_cart(entry)
    # instead of calling NoticeMailer.cart_notice we'll do
    MailWorker.perform_async(entry.id)
  end
end
