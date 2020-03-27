class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @user = User.find(session[:user_id])
    @post = @user.posts.new(id: :post_id)
  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.Post.find(params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.create(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      Post.all
      render :index
    end
  end

  def update
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @post.update(post_params)
    redirect_to post_url(@post)
  end

  def destroy
    @user.find(params[:user_id])
    @post = @user.Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :summary, :id, :post_id )
    end

end
