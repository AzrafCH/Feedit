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
   @comment = Comment.create(comment_params)
   @comment.user_id = current_user.id

   if @comment.save
     redirect_to comment_url(@comment)
   else
     render :index
   end
 end

 def update
   @comment = Comment.find(params[:id])
   @comment.update(comment_params)
   redirect_to comment_url(@comment)
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
