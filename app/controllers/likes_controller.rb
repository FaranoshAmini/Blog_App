class LikesController < ApplicationController
  def create
    @new_like = Like.new(post_id: params[:post_id], author_id: current_user.id)
    redirect_to users_path if @new_like.save else redirect_to :new
  end
end
