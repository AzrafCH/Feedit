class UsersController < ApplicationController

  def index
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
    @user.settings.build(setting_type: 'bio')
    @user.settings.build(setting_type: 'age')
    @user.settings.build(setting_type: 'location')
  end

  def update
    @user = User.find(params[:id])
    @user.update(settings: [:user][:settings][])
    redirect_to users_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, settings: [:bio, :location, :age])
  end
end
