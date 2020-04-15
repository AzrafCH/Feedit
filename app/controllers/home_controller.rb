class HomeController < ApplicationController

  def index
    @posts = Post.all
    @subfeds = Subfed.all
  end
end
