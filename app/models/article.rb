class Article < ActiveRecord::Base
  attr_accessible :comment_id, :date, :description, :entry_id, :title, :user_id, :publish
  belongs_to :user
  has_many :comments

  default_scope order: "created_at DESC"
  paginates_per  5

end
