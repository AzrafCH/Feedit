class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    @user = User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def logged_in?
    !current_user.nil?
  end

  def require_logged_in
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end

  def authorized
    if current_user != post.current_user
      redirect_to users_path
    else
      current_user
    end 
  end 
end
