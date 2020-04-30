class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_or_create_by(id: auth['uid']) do |u|
        u.username = auth['info']['name']
        u.email = auth['info']['email']
        u.password = auth['info']['password']
      end 
      @user.save
      session[:user_id] = @user.id
      redirect_to users_path(@user.id)
    else
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
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

  private 

  def auth 
    request.env['omniauth.auth']
  end 
end
