class Entry < ActiveRecord::Base
  attr_accessible :article_id, :cart_id
  belongs_to :article
  belongs_to :cart
  belongs_to :watch
  default_scope order: "created_at DESC"

  def cart_hold?
    Entry.where(
      article_id: self.article_id,
      watch_id: nil
    ).exists?
  end

end
