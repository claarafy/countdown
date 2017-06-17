class InvitesController < ApplicationController
  def index
    @invites = current_user.invitations.all
  end

  def show
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(:message => params[:invite][:message], :receiver_id => params[:invite][:receiver_id])
    @invite.sender = current_user
    @receiver = User.find_by_email(params[:invite][:receiver_id])
    @invite.receiver = @receiver
    @group = Group.find(params[:group_id])
    @invite.group = @group

    if @invite.save
      flash[:invite_sent] = "Invite Sent!"
      redirect_to group_path(@group)
    else
      redirect_to root_path
    end
  end

  def edit

  end

  def update

  end

  # create an explict action for accepting

  def destroy
  end

end
