class LikesController < ApplicationController
  def create
    @new_like = Like.new(post_id: params[:post_id], author_id: current_user.id)
    if @new_like.save
      redirect_to users_path
    else
      redirect_to :new end
  end
end
