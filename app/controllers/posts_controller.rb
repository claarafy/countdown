class PostsController < ApplicationController
  before_action :authorize

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :date, :location, :body, :img_url)
  end
end
