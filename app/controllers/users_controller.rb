class UsersController < ApplicationController
  load_resource

  def new; end

  def index; end

  def show; end

  def create
    # after signup(creating data) send "UserMailer.welcome_email.deliver_now"
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.following << @user unless current_user.following.include?(@user)
    redirect_to @user, notice: 'Successfully followed user.'
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.following.delete(@user)
    redirect_to @user, notice: 'Successfully unfollowed user.'
  end

  def update
    @user = User.find(params[:id])
    return unless @user.update(user_params)

    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:email, :password, :profile_picture)
  end
end
