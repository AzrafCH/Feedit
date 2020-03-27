

class SubfedsController < ApplicationController

  def index
    @subfeds = Subfed.all
  end

  def new
    @user = User.find(params[:user_id])
    @subfed = @user.Subfed.new(id: :subfed_id)
  end

  def edit
    @user = User.find(params[:user_id])
    @subfed = @user.Subfed.find(params[:subfed_id])
  end

  def show
    @subfed = Subfed.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @subfed = @user.Subfed.create(subfed_params)

    if @subfed.save
      redirect_to subfed_url(@subfed)
    else
      @user.Subfed.all
      render :index
    end
  end

  def update
    @user = User.find(params[:user_id])
    @subfed = Subfed.find(params[:subfed_id])
    @subfed.update(subfed_params)
    redirect_to subfed_url(@subfed)
  end

  def destroy
    @user = User.find(session[:user_id])
    @subfed = @user.subfeds.find(params[:id]).destroy
    redirect_to subfeds_path
  end

  private
    def subfed_params
      params.require(:subfed).permit(:title, :content, :id, :subfed_id)
    end

end
