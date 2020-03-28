class SubfedsController < ApplicationController

  before_action :current_user

  def index
    @subfeds = Subfed.all
  end

  def new
    @user = current_user
    @subfed = @user.subfeds.new(subfed_params)
  end

  def edit
    @subfed = Subfed.find(params[:id])
  end

  def show
    @subfed = Subfed.find(params[:id])
  end

  def create
    @subfed = Subfed.create(subfed_params)

    if @subfed.save!
      redirect_to subfed_url(@subfed)
    else
      Subfed.all
      render :index
    end
  end

  def update
    @subfed = Subfed.find(params[:id])
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
