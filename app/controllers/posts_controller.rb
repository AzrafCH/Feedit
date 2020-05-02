class PostsController < ApplicationController
    before_action :require_logged_in
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    after_action :verify_authorized
    after_action :verify_policy_scoped

  def index
    @posts = Post.all
    @recent_posts = Post.all.recent(10)
  end

  def new
    @post = current_user.posts.new
    @subfeds = Subfed.all
    authorize @post
  end

  def edit
  end

  def show
    @subfed = Subfed.find_by(params[:subfed_id])

    @comment = Comment.new
    @comment.post_id = params[:post_id]
    @comment.user_id = session[:user_id]
    @comment.save
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      authorize @post
      redirect_to post_path(@post.id)
    else
      @subfeds = Subfed.all
      render 'new'
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update(post_params)
    redirect_to post_url(@post)
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find_by(id: params[:id])
      authorize @post
    end

    def post_params
      params.require(:post).permit( :title, :summary, :subfed_id, :user_id)
    end

end
