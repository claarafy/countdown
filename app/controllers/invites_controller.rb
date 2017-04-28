class InvitesController < ApplicationController
  def index
  end

  def show
  end

  def new

  end

  def create
    @invite = Invite.new(:message => params[:invite][:message], :receiver_id => params[:invite][:receiver_id])
    @invite.sender = current_user
    @receiver = User.find(params[:invite][:receiver_id])
    @invite.receiver = @receiver
    @group = Group.find(params[:group_id])
    @invite.group = @group

    if @invite.save
      redirect_to group_path(@group)
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def create
  end

  def destroy
  end

end
