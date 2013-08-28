class Contact < ActiveRecord::Base
  attr_accessible :adress,
                  :category,
                  :description,
                  :name

  validates_presence_of :adress, :category, :description, :name
  validates_length_of :description, maximum: 2000, too_long: "2000文字以内にで投稿してください"
end
