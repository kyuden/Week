class Article < ActiveRecord::Base
  acts_as_gmappable validation: false,
                    check_process: false,
                    :msg => "Sorry, not even Google could figure out where that is"

  attr_accessible :comment_id,
                  :date,
                  :description,
                  :entry_id,
                  :title,
                  :user_id,
                  :publish,
                  :disp_day,
                  :about_time,
                  :place_adress,
                  :place_name,
                  :latitude,
                  :longitude,
                  :gmaps

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :entries, :dependent => :destroy

  validates_presence_of :title, message: "イベントが入力されていません"
  validates_length_of :title, maximum: (410), too_long: "410文字以内で投稿してください"
  default_scope order: "created_at DESC"
  paginates_per  5

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.place_adress}"
  end

  def gmaps4rails_infowindow
    "集合場所: #{self.place_name}"
  end

  def gmaps4rails_title
    "集合場所: #{self.place_name}"
  end

  def cart_hold?(user)
    Entry.where(
      article_id: self,
      watch_id: nil,
      cart_id: user.cart
    ).exists?
  end

  def watch_hold?(user)
    Entry.where(
      article_id: self,
      cart_id: nil,
      watch_id: user.watch
    ).exists?
  end

  def cart_hold(user)
    Entry.where(
      article_id: self,
      watch_id: nil,
      cart_id: user.cart
    ).first
  end

  def watch_hold(user)
    Entry.where(
      article_id: self,
      cart_id: nil,
      watch_id: user.watch
    ).first
  end

end
