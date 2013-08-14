class UsersController < ApplicationController
  before_filter :check_self,     only:   [:edit, :show, :update]
  before_filter :check_logined,  except: [:callback, :create, :log_out]
  after_filter  :delete_session, only:   [:callback]

  #log_in
  def callback
    @auth = request.env["omniauth.auth"]
    user = User.select(:id).find_by_uid(@auth['uid'])

    if user
      session[:user_id] = user.id
      redirect_to session[:referer] || root_path
    else
      @user = User.new
      render 'users/_form', layout: "one_column_layout"
    end
  end

  def create
    @user = User.new(params[:user])
    session[:user_id] = @user

    respond_to do |format|
      if @user.save
        current_cart
        current_watch
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render 'form'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def log_out
    session[:user_id] = nil
    render 'users/login', notice: "logout", layout: false
  end

  def update
    @user = User.select(" id,
                          name,
                          email,
                          location,
                          age,
                          updated_at")
                .find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def delete_session
    session[:referer] = nil
  end

  def check_self
    unless current_user.id.to_s == params[:id] || params[:user_id]
      raise Forbidden
    end
  end
end
