class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password]) #NOTE if correct email/pw inserted
      session[:user_id] = @user.id #NOTE save that session id as that user id
      redirect_to user_path(@user) #NOTE AND direct that user to one's page
    else
      flash[:alert] = "Incorrect id or password!"
      redirect_to new_session_path #NOTE if fails go back to login form
    end
  end

  def destroy #NOTE Logging out
    session[:user_id] = nil #NOTE set the session of that user as nil
    redirect_to root_path #NOTE And take one back to home
  end
end
