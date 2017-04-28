class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @groups = @user.groups
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(currnet_user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:profile_pic, :email, :password, :first_name, :last_name, :birthday, :current_location, :_destroy)
  end
end
