class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
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
    @group = Group.new
  end

  def update
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
