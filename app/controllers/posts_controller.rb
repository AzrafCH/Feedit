class PostsController < ApplicationController

    before_action :require_logged_in, :current_user

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
    @post = Post.find_by(params[:id])
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      Post.all
      render :index
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
    def post_params
      params.require(:post).permit( :title, :summary, :subfed_id, :user_id)
    end

end
