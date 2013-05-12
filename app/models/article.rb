class Article < ActiveRecord::Base
  attr_accessible :comment_id, :date, :description, :entry_id, :title, :user_id
end
