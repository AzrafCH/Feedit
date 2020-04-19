class UsersController < ApplicationController

  def index
    @subfeds = Subfed.all
    @posts = Post.all
    @users = User.all
  end

  def new
    @user = User.new
    @user.settings.build(bio: "Tell us about you!")
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path(@user.id)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.settings == false
      @user.settings.build(bio: "Tell us about you!")
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to users_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :user_id, :settings_attributes => [:bio, :location, :age, :id, :_destroy ])
  end
end
