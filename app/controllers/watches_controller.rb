class WatchesController < ApplicationController
  def index
    @entries = Entry.select("entries.id, entries.article_id")
                    .includes(article: [:user, :comments])
                    .where(watch_id: current_user.watch).page params[:page]

    respond_to do |format|
      format.js
      format.html
      format.json { render json: current_user.watch }
    end
  end
end
