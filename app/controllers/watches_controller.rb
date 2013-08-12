class WatchesController < ApplicationController
  def index
    @watches = Watch.find(current_user.watch)
    @graph = Koala::Facebook::API.new(current_user.access_token)

    respond_to do |format|
      format.html
      format.json { render json: @watches }
    end
  end
end
