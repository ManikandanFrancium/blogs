class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      flash[:alert] = 'comment was failed.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
