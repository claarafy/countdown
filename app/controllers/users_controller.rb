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
      redirect_to users_path
    else
      redirect_to new_user_path
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :birthday, :current_location, :user_id, :group_id, :_destroy)
  end
end
