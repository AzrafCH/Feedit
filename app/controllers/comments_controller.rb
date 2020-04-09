class CommentsController < ApplicationController

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
   if @comment.save
     redirect_to comment_url(@comment)
   else
     Comment.all
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
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
