class GroupsController < ApplicationController
  before_action :authorize
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @post = @group.posts.build
    @invite = Invite.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user

    if @group.save
      redirect_to group_path(@group)
    else
      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(group_params)
      redirect_to group_path(@group)
    else
      redirect_to edit_group_path(@group)
    end
  end

  def destroy
    @group = Group.find(params[:id])

    if @group.destroy
      redirect_to current_user
    else

    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
