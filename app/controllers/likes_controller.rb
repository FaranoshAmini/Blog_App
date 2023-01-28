class LikesController < ApplicationController
    def create
        @new_like = Like.new(post_id: params[:post_id], author_id: current_user.id)
         if @new_like.save then redirect_to users_path end
    end
end
