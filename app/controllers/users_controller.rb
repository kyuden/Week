class UsersController < ApplicationController
  layout "one_column_layout"

  def callback
    @auth = request.env["omniauth.auth"]
    user = User.find_by_uid(@auth['uid'])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "login"
    else
      @user = User.new
      render 'users/_form'
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    session[:user_id] = @user

    respond_to do |format|
      if @user.save
        logger.debug "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render 'form'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    logger.debug "AAAAAAAAAAAAAAAASASASA#{params[:id]}"
    # @user = User.find(params[:id])
    # @user.destroy
    session[:user_id] = nil
    redirect_to '/home/index', notice: "logout"
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

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
end
