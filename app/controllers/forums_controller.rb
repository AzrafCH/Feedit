class ForumsController < ApplicationController

  def create
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @subfed = Subfed.find(params[:id])

    @forum = Forum.create(user_id: @user.id, subfed_id: @subfed.id, post_id: @post.id)
    @forum.save
  end

end
