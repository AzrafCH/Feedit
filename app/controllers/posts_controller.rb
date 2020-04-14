class PostsController < ApplicationController

    before_action :require_logged_in

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @subfeds = Subfed.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find_by(params[:post_id])
    @subfed = Subfed.find_by(params[:subfed_id])

    @comment = Comment.new
    @comment.post_id = @post.id
    @comment.user_id = session[:user_id]
    @comment.save
  end

  def create
    @subfed = Subfed.find_by_id(params[:id])
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
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
    def post_params
      params.require(:post).permit( :title, :summary, :subfed_id, :user_id)
    end

end
