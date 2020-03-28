class PostsController < ApplicationController

  before_action :current_user

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new(post_params)
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def create
    @subfed = Subfed.find_by(params[:id])
    @post = Post.create(post_params)

    if @post.save
      @subfed.posts << @post
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
      params.permit(:title, :summary, :id, :post_id )
    end

end
