class UsersController < ApplicationController

  def index
    @subfeds = Subfed.all
    @posts = Post.all
  end

  def new
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'home', action: 'index'
  end

  def edit
    @user = User.find(params[:id])
    @user.settings.build(age: 'How old are you?', bio: 'Tell me about yourself...', location: 'Where do you live?')
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :user_id, settings: [:bio, :location, :age])
  end
end
