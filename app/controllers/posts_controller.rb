class PostsController < ApplicationController
    before_action :require_logged_in

  def index
    @posts = Post.all
    @recent_posts = Post.all.recent(10)
  end

  def new
    @post = current_user.posts.new
    @subfeds = Subfed.all
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def show
    @subfed = Subfed.find_by(params[:subfed_id])
    @post =  Post.find_by(id: params[:id])
    @comment = Comment.new
    @comment.post_id = params[:post_id]
    @comment.user_id = session[:user_id]
    @comment.save
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      @subfeds = Subfed.all
      render 'new'
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.user_id == current_user.id
      @post.update(post_params)
      redirect_to post_url(@post)
    else
      redirect_to users_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post = Post.find(params[:id]).destroy
      redirect_to posts_path
    else
      redirect_to users_path
    end
  end

  private

    def post_params
      params.require(:post).permit( :title, :summary, :subfed_id, :user_id)
    end

end
