class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        if params[:type] == 'Cart'
          format.html { redirect_to carts_url , notice: 'Comment was successfully created.' }
          format.js
        elsif params[:type] == 'Watch'
          format.html { redirect_to watches_url , notice: 'Comment was successfully created.' }
          format.js
        else
          format.html { redirect_to root_url , notice: 'Comment was successfully created.' }
          format.js
        end
        format.json { render json: @comment, status: :created, location: @comment }
        format.js
      else
        format.html { render action: "new" }
        format.js
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
