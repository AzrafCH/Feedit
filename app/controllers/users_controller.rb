class UsersController < ApplicationController

  def index
    @subfeds = Subfed.all
    @posts = Post.all
    @users = User.all
  end

  def new
    @user = User.new
    @user.settings.build(age: 'How old are you?', bio: 'Tell me about yourself...', location: 'Where do you live?')
  end

  def create
    @user = User.create(user_params)
    @user.settings = params[:user][:settings]
    session[:user_id] = @user.id
    return redirect_to controller: 'users', action: 'new' unless @user.save
    redirect_to controller: 'users', action: 'index'
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
    params.require(:user).permit(:username, :password, :email, :user_id, :settings => [:bio, :location, :age ])
  end
end
