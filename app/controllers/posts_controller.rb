class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @group = @post.group_id
  end

  def new
    @post = Post.new
    @group = Group.find(params[:group_id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.group = Group.find(params[:group_id])

    if @post.save
      redirect_to group_path(@post.group)
    else
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.user = current_user

    if @post.update_attributes(post_params)
        redirect_to post_path(@post)
    else
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:id, :title, :date, :location, :body, :img_url,:user_id, :group_id, :_destroy)
  end
end
