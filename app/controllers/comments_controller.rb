class CommentsController < ApplicationController

  before_action :require_logged_in

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @posts = Post.all
  end

 def edit
   @comment = Comment.find(params[:id])
 end

 def show
   @comment = Comment.find(params[:id])
 end

 def create
   @user = User.find_by(id: params[:id])
   @post = Post.find_by(id: params[:id])
   @posts = Post.all
   @comment = Comment.create(comment_params)
   @comment.user_id = current_user.id
   if @comment.save
     redirect_to post_path(@comment)
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
   redirect_to comments_path
 end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
