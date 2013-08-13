class EntriesController < ApplicationController
  before_filter :check_self, only: [:destroy]

  def create
    if params[:type] == 'Cart'
      @cart = current_cart
      article = Article.find(params[:article_id])
      @entry = @cart.entries.build(article_id: article.id)

      respond_to do |format|
        if @entry.save
          format.html { redirect_to carts_url, notice: 'Entry was successfully created.' }
          format.js
          format.json { render json: @entry, status: :created, location: @entry }
        else
          format.html { render action: "new" }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    else
      @watch = current_watch
      article = Article.find(params[:article_id])
      @watch = @watch.entries.build(article_id: article.id)

      respond_to do |format|
        if @watch.save
          format.html { redirect_to root_url, notice: 'Entry was successfully created.' }
          format.js
          format.json { render json: @entry, status: :created, location: @entry }
        else
          format.html { render action: "new" }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    respond_to do |format|
      if params[:type] == 'Cart'
        format.html { redirect_to carts_url }
        format.js
      elsif params[:type] == 'Watch'
        format.html { redirect_to watches_url }
        format.js
      else
        format.html { redirect_to root_url }
        format.js {render :file => "entries/toggle.js.erb"}
      end
      format.json { head :no_content }
    end
  end

  private
  def check_self
    unless current_user == Entry.find(params[:id]).article.user
      raise Forbidden
    end
  end
end
