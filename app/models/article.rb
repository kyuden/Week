class Article < ActiveRecord::Base
  attr_accessible :comment_id, :date, :description, :entry_id, :title, :user_id, :publish
  belongs_to :user
  has_many :comments
  has_many :entries

  default_scope order: "created_at DESC"
  paginates_per  5

  def cart_hold?(user)
    Entry.where(
      article_id: self,
      watch_id: nil,
      cart_id: user.cart
    ).exists?
  end

  def watch_hold?(user)
    Entry.where(
      article_id: self,
      cart_id: nil,
      watch_id: user.watch
    ).exists?
  end

  def cart_hold(user)
    Entry.where(
      article_id: self,
      watch_id: nil,
      cart_id: user.cart
    ).first
  end

  def watch_hold(user)
    Entry.where(
      article_id: self,
      cart_id: nil,
      watch_id: user.watch
    ).first
  end

end
