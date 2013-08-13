class Entry < ActiveRecord::Base
  attr_accessible :article_id, :cart_id
  belongs_to :article
  belongs_to :cart
  belongs_to :watch

  default_scope order: "created_at DESC"
  paginates_per  5

  def cart_hold?(user)
    Entry.where(
      article_id: self.article_id,
      watch_id: nil,
      cart_id: user.cart
    ).exists?
  end

end
