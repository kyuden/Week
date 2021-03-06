class UsersController < ApplicationController
  before_filter :check_self,     only:   [:edit, :show, :update]
  before_filter :check_logined,  except: [:callback, :create, :log_out]

  def create
    @user = User.new(params[:user])
    session[:user_id] = @user

    respond_to do |format|
      if @user.save
        session[:auth] = nil
        current_cart
        current_watch
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        @auth = session[:auth]
        @location = JpPrefecture::Prefecture.all
        format.html { render 'users/_form', layout: "one_column_layout"}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        @location = JpPrefecture::Prefecture.all
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @location = JpPrefecture::Prefecture.all
  end

  private
    def check_self
      unless current_user.id.to_s == params[:id] || params[:user_id]
        raise Forbidden
      end
    end
end
