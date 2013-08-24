class UsersController < ApplicationController
  before_filter :check_self,     only:   [:edit, :show, :update]
  before_filter :check_logined,  except: [:callback, :create, :log_out]

  def create
    @user = User.new(params[:user])
    request.session_options[:expire_after] = 1.months.from_now
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
    def check_self
      unless current_user.id.to_s == params[:id] || params[:user_id]
        raise Forbidden
      end
    end
end
