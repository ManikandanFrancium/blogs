class FollowersController < ApplicationController
  load_resource
  before_action :set_user

  def create
    follower_id = current_user.id
    @follow = Follow.new(user: @user, follower_id:)
    if @follow.save
      redirect_to profile_user_path(@user)
    else
      # flash
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
