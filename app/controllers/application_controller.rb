class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :my_event_count

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_cart
    if current_user.cart
      Cart.find(current_user.cart)
    else
      cart = Cart.create(user_id: current_user.id)
      cart
    end
  end

  def current_watch
    if current_user.watch
      Watch.find(current_user.watch)
    else
      watch = Watch.create(user_id: current_user.id)
      watch
    end
  end

  def my_event_count
    Article.where(user_id: current_user).length
  end
end
