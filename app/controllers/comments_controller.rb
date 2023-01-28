class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @new_comment = Comment.new(text: params[:comment][:text], author: current_user, post_id: params[:post_id].to_i)
    redirect_to users_path if @new_comment.save
  end
end
