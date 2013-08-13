class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_logined

  rescue_from Exception,                       with: :render_500 if Rails.env == 'production'
  rescue_from ActiveRecord::RecordNotFound,    with: :render_404 if Rails.env == 'production'
  rescue_from ActionController::UnknownAction, with: :render_404 if Rails.env == 'production'
  rescue_from ActionController::RoutingError,  with: :render_404 if Rails.env == 'production'

  class Forbidden < StandardError; end

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    render template: "errors/error_404", status: 404, layout: false, content_type: 'text/html'
  end

  def render_500(exception = nil)
    if exception
      logger.info "Rendering 500 with exception: #{exception.message}"
    end

    render template: "errors/error_500", status: 500, layout: false, content_type: 'text/html'
  end


  helper_method :current_user, :my_event_count

  private
  def check_logined
    unless current_user
      session[:referer] = request.fullpath
      render template: 'users/login', layout: false
    end
  end

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
