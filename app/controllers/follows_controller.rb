class FollowsController < ApplicationController
  load_resource
  before_action :set_user

  def create
    @follow = Follow.new(follower_id: @user.id, following_id: current_user.id)
    if @follow.save
      redirect_to user_path(@user)
    else
      # flash
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
