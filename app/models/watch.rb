class Watch < ActiveRecord::Base
  attr_accessible :user_id, :entry_id
  has_many :entries
  belongs_to :user

end
