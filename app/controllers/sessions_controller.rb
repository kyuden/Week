class SessionsController < ApplicationController
  skip_before_filter :check_logined
  after_filter       :delete_session, only: [:callback]

  #log_in
  def callback
    @auth = request.env["omniauth.auth"]
    user = User.select(:id).find_by_uid(@auth['uid'])

    if user
      #request.session_options[:expire_after] = 1.months.from_now
      session[:user_id] = user.id
      redirect_to session[:referer] || root_path
    else
      @user = User.new
      render 'users/_form', layout: "one_column_layout"
    end
  end

  def log_out
    session[:user_id] = nil
    render 'users/login', notice: "logout", layout: false
  end

 private
   def delete_session
    session[:referer] = nil
   end
end