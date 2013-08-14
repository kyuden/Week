class CartsController < ApplicationController
  def index
    @entries = Entry.select("entries.id, entries.article_id")
                    .includes(article: [:user, :comments])
                    .where(cart_id: current_user.cart).page params[:page]

    @graph   = Koala::Facebook::API.new(current_user.access_token)

    respond_to do |format|
      format.js
      format.html
      format.json { render json: current_user.cart }
    end
  end
end
