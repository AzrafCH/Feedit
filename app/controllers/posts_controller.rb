class PostsController < ApplicationController
    before_action :require_logged_in, :current_user

  def index
    @posts = Post.all
    @recent_posts = Post.all.recent(10)
  end

  def new
    @post = Post.new
    @subfeds = Subfed.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @subfed = Subfed.find_by(params[:subfed_id])

    @comment = Comment.new
    @comment.post_id = params[:post_id]
    @comment.user_id = session[:user_id]
    @comment.save
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
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
    def post_params
      params.require(:post).permit( :title, :summary, :subfed_id, :user_id)
    end

end
