class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if request.env['omniauth.auth']
      user = User.create_by_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to users_path(user.id)
    else
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to users_path(user.id)
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
