class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post: @post)
  end

  def new
    @post = Post.new
  end

  def create
    @new_post = Post.new(title: params[:post][:title], text: params[:post][:text], author: current_user,
                         comments_counter: 0, likes_counter: 0)
    if @new_post.save
      redirect_to users_path
    else
      redirect_to :new end
  end
end
