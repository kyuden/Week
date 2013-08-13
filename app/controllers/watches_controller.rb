class WatchesController < ApplicationController
  def index
    @entries = Entry.where(watch_id: current_user.watch).page params[:page]
    @graph   = Koala::Facebook::API.new(current_user.access_token)

    respond_to do |format|
      format.js
      format.html
      format.json { render json: @watch }
    end
  end
end
