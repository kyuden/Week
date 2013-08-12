class CartsController < ApplicationController
  def index
    @cart = Cart.find(current_user.cart)
    @graph = Koala::Facebook::API.new(current_user.access_token)

    respond_to do |format|
      format.html
      format.json { render json: @carts }
    end
  end
end
