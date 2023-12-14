class PostsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  load_resource
  def index
    # @post = Post.all
    # render json: PostSerializer.new(@posts)
  end

  def show
    # @post = Post.find(params[:id])
    # render json: PostSerializer.new(@post)
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    # @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    # @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    @post = Post.find(params[:id])
    return unless @post.update(post_params)

    redirect_to posts_path
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description, :user_id)
  end
end
