class ArticlesController < ApplicationController

  def search
    @article = Article.new
    @articles = Article.joins(:user).where("location = ? AND age = ? AND (title LIKE ? OR disp_day LIKE ?)", current_user.location, current_user.age, "%#{params[:query]}%", "%#{params[:query]}%" ).page(params[:page])
    @graph = Koala::Facebook::API.new(current_user.access_token)

    render action: :index
  end

  def index
    @article = Article.new
    @articles = Article.joins(:user).where("location = ? AND age = ?", current_user.location, current_user.age).page(params[:page])
    @graph = Koala::Facebook::API.new(current_user.access_token)
  end

  def my_index
    @articles = Article.where(user_id: current_user).page(params[:page])
    @graph = Koala::Facebook::API.new(current_user.access_token)
  end

  def show
    @article = Article.find(params[:id])
    @entries = Entry.where(article_id: @article, watch_id: nil)
    @json = Article.find(params[:id]).to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  def edit
    @article = Article.find(params[:id])
    @json = Article.find(params[:id]).to_gmaps4rails
  end

  def create
    @article = Article.new(params[:article])
    @graph = Koala::Facebook::API.new(current_user.access_token)

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
        format.js
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.js
      format.json { head :no_content }
    end
  end

  def send_mail
    entries = Entry.where(article_id: params[:id], watch_id: nil)
    mail = OwnerMailer.detail_mail(entries)
    mail.transport_encoding = "8bit"
    mail.deliver
    redirect_to article_path(params[:id])
  end
end
