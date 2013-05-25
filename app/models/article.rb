class Article < ActiveRecord::Base
  attr_accessible :comment_id, :date, :description, :entry_id, :title, :user_id, :publish
  belongs_to :user
  has_many :comments
  has_many :entries

  default_scope order: "created_at DESC"
  paginates_per  5

  def cart_hold?
    Entry.where(
      article_id: self,
      watch_id: nil
    ).exists?
  end

  def watch_hold?
    Entry.where(
      article_id: self,
      cart_id: nil
    ).exists?
  end

  def cart_hold
    Entry.where(
      article_id: self,
      watch_id: nil
    ).first
  end

  def watch_hold
    Entry.where(
      article_id: self,
      cart_id: nil
    ).first
  end

end
