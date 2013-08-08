class Comment < ActiveRecord::Base
  attr_accessible :article_id,
                  :body,
                  :user_id,
                  :user

  belongs_to :article
  belongs_to :user

  validates_presence_of :body
  validates_length_of :body, :in => (1..310)
end
