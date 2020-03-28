class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new(post_params)
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)

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
      params.permit( :title, :summary, :post_id)
    end

end
