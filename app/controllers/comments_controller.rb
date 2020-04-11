class CommentsController < ApplicationController

  before_action :require_logged_in

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

 def edit
   @comment = Comment.find(params[:id])
 end

 def show
   @comment = Comment.find(params[:id])
 end

 def create
   @comment = Comment.new(comment_params)
   @comment.user_id = session[:user_id]
   @comment.post_id = params[:post_id]

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
