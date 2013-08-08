class Comment < ActiveRecord::Base
  attr_accessible :article_id,
                  :body,
                  :user_id,
                  :user

  belongs_to :article
  belongs_to :user

  validates_presence_of :body, message: "コメントが入力されていません"
  validates_length_of :body, maximum: 310, too_long: "310文字以内で投稿してください"
end
