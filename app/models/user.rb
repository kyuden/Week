class User < ActiveRecord::Base
  attr_accessible :uid, :name, :age, :location, :email, :gender, :access_token, :image, :url
  has_many :articles
  has_many :comments
  has_one :cart
  has_one :watch

  validates_presence_of :uid, :name, :age, :location, :email, :access_token

  include JpPrefecture
  jp_prefecture :prefecture_code

  def location_name
    JpPrefecture::Prefecture.find(self.location).name
  end

  def minimum_image
    self.image.sub(/type=square/, "width=25&height=25&type=square")
  end

  def small_image
    self.image.sub(/type=square/, "width=15&height=15")
  end

  def normal_image
    self.image.sub(/square/, "normal")
  end

  def large_image
    self.image.sub(/square/, "large")
  end
end
