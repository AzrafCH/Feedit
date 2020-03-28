class PostsController < ApplicationController

  before_action :current_user

  def index
    @posts = Post.all
  end

  def new
    @subfed = Subfed.find(params[:subfed_id])
    @post = @subfed.posts.new
  end

  def edit
    @subfed = Subfed.find(params[:subfed_id])
    @post = Post.find(params[:post_id])
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def create
    @subfed = Subfed.find(params[:subfed_id])
    @post = @subfed.posts.new(post_params)
    @post.user_id = current_user.user_id
    @post.post_id = params[:id]

    if @post.save
      redirect_to post_url(@post)
    else
      Post.all
      render :index
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @post.update(post_params)
    redirect_to post_url(@post)
  end

  def destroy
    @post = Post.find(params[:post_id]).destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :summary, :id, :post_id )
    end

end
