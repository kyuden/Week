class Cart < ActiveRecord::Base
  attr_accessible :user_id, :entry_id, :cart_type
  has_many :entries
  belongs_to :user

end
