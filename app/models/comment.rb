class Comment < ActiveRecord::Base
  attr_accessible :article_id, :body, :user_id, :user
  belongs_to :article
  belongs_to :user

end
