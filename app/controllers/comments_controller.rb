class CommentsController < ApplicationController

  before_action :require_logged_in

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @post = Post.find_by(params[:id])
    @user = User.find_by(params[:id])
  end

 def edit
   @comment = Comment.find(params[:id])
 end

 def show
   @comment = Comment.find(params[:id])
 end

 def create
   @user = User.find_by(params[:id])
   @post = Post.find_by(params[:id])

   @comment = Comment.new(comment_params)
   @comment.user_id = @user.id
   @comment.post_id = @post.id

   @comment.save
   redirect_to post_path (@comment.post)
 end

 def update
   @comment = Comment.find(params[:id])
   @comment.update(comment_params)
  redirect_to post_path (@comment.post)
 end

 def destroy
   @comment = Comment.find(params[:id]).destroy
   redirect_to comments_path
 end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
