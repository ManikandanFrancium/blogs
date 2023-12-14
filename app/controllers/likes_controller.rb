class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(like_params)
    @like.user_id = current_user.id
    if @like.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      flash[:alert] = 'like was failed.'
    end
  end

  private

  def like_params; end
end
