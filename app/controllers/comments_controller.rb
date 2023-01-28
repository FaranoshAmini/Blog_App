class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @new_comment = Comment.new(text: params[:comment][:text], author: current_user, post_id: params[:post_id].to_i)
    if @new_comment.save
      redirect_to users_path
    else
      redirect_to :new end
  end
end
