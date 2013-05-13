class Article < ActiveRecord::Base
  attr_accessible :comment_id, :date, :description, :entry_id, :title, :user_id
  belongs_to :user
  has_many :comments

end
