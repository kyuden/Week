class User < ActiveRecord::Base
  attr_accessible :uid, :name, :age, :location, :email, :gender, :access_token, :image, :url
  include JpPrefecture
  jp_prefecture :prefecture_code

  def location_name
    JpPrefecture::Prefecture.find(self.location).name
  end
end
