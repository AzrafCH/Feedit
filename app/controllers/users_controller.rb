class UsersController < ApplicationController

  def index
    @subfeds = Subfed.all
    @posts = Post.all
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    return redirect_to controller: 'users', action: 'new' unless @user.save

    redirect_to controller: 'users', action: 'index'
  end

  def edit
    @user = User.find(params[:id])
    @user.settings.build(bio: "Tell me about yourself...")
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to users_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :user_id, :settings_attributes => [:bio, :location, :age, :id ])
  end
end
