class SubfedsController < ApplicationController

  def index
    @user = User.where(user_id: current_user.id)
    @subfeds = Subfed.all
  end

  def new
    @user = User.where(user_id: current_user.id)
    @subfed = @user.subfeds.new(subfed_params)
  end

  def edit
    @user = User.where(user_id: current_user.id)
    @subfed = current_user.subfeds.find(params[:id])
  end

  def show
    @user = User.where(user_id: current_user.id)
    @subfed = Subfed.find(params[:id])
  end

  def create
    @user = User.where(user_id: current_user.id)
    @subfed = @user.subfeds.create(subfed_params)

    if @subfed.save!
      redirect_to subfed_url(@subfed)
    else
      Subfed.all
      render :index
    end
  end

  def update
    @user = User.where(user_id: current_user.id)
    @subfed = @user.subfeds.find(params[:id])
    @subfed.update(subfed_params)
    redirect_to subfed_url(@subfed)
  end

  def destroy
    @subfed = Subfed.find(params[:id]).destroy
    redirect_to subfeds_path
  end

  private

    def subfed_params
      params.permit(:title, :content, :id, :subfed_id)
    end

end
