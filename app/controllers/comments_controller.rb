class CommentsController < ApplicationController
    before_action :require_logged_in, :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

 def create
   @comment = Comment.new(comment_params)
   @comment.post_id = params[:post_id]
   @comment.user_id = current_user.id
   if @comment.save
     redirect_to post_path(@comment.post)
   else
     render 'new'
   end
 end

 def update
   @comment = Comment.find(params[:id])
   @comment.update(comment_params)
   redirect_to post_path (@comment.post)
 end

 def destroy
   @comment = Comment.find(params[:id]).destroy
   redirect_to post_path(@comment.post)
 end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
