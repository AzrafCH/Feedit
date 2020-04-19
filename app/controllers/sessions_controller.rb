class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    @user.authenticate(params[:password])
    return redirect_to(controller: 'sessions', action: 'new') unless @user
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'index'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
