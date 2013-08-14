class ArticlesController < ApplicationController
  before_filter :check_self, only: [:edit, :update, :destroy, :send_mail]

  def search
    @article  = Article.new
    @articles = Article.select("articles.id,
                                disp_day,
                                about_time,
                                title,
                                publish,
                                user_id,
                                comment_id")
                        .joins(:user)
                        .where("users.location = ? AND users.age = ? AND (title LIKE ? OR disp_day LIKE ?)", current_user.location, current_user.age, "%#{params[:query]}%", "%#{params[:query]}%" )
                        .includes([:user, comments: :user])
                        .page params[:page]

    @graph = Koala::Facebook::API.new(current_user.access_token)

    render action: :index
  end

  def index
    @article  = Article.new
    @articles = Article.select("articles.id,
                                disp_day,
                                about_time,
                                title,
                                publish,
                                user_id,
                                comment_id")
                       .joins(:user)
                       .where("users.location = ? AND users.age = ?", current_user.location, current_user.age)
                       .includes([:user, comments: :user])
                       .page params[:page]
    @graph = Koala::Facebook::API.new(current_user.access_token)
  end

  def my_index
    @articles = Article.select("articles.id,
                                disp_day,
                                about_time,
                                title,
                                publish,
                                user_id,
                                comment_id")
                        .where(user_id: current_user)
                        .includes([:user, comments: :user])
                        .page params[:page]

    @graph = Koala::Facebook::API.new(current_user.access_token)

    respond_to do |format|
      format.js {render 'index.js.erb'}
      format.html
      format.json { render json: @article }
    end
  end

  def show
    @article = Article.select(" articles.id,
                                user_id,
                                title,
                                disp_day,
                                date,
                                place_name,
                                place_adress,
                                description")
                      .find(params[:id])

    @article_user = @article.user
    @entries = Entry.includes(cart: :user).where(article_id: @article, watch_id: nil)
    @json = Article.find(params[:id]).to_gmaps4rails

    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end

  def edit
    @article = Article.select(" articles.id,
                                title,
                                description,
                                date,
                                user_id,
                                publish,
                                disp_day,
                                about_time,
                                place_adress,
                                place_name")
                      .find(params[:id])
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
    @article = Article.select(" articles.id,
                                title,
                                description,
                                date,
                                user_id,
                                publish,
                                disp_day,
                                about_time,
                                place_adress,
                                place_name,
                                updated_at")
                        .find(params[:id])

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
    @article = Article.select(:id).find(params[:id])
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

  private
  def check_self
    unless current_user == Article.select("id, user_id").find(params[:id]).user
      raise Forbidden
    end
  end
end
