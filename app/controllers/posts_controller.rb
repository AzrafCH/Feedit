class PostsController < ApplicationController

  def index
    @user = user.where(user_id: current_user.id)
    @posts = @user.posts.all
  end

  def new
    @post = current_user.posts.new(post_params)
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def show
    @user = User.where(user_id: current_user.id)
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      Post.all
      render :index
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)
    redirect_to post_url(@post)
  end

  def destroy
    @post = current_user.posts.find(params[:id]).destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.permit(:title, :summary, :id, :post_id )
    end

end
