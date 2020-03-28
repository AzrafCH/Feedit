class SubfedsController < ApplicationController

  before_action :current_user

  def index
    @subfeds = Subfed.all
  end

  def new
    @subfed = current_user.subfeds.new(subfed_params)
  end

  def edit
    @subfed = current_user.subfeds.find(params[:id])
  end

  def show
    @subfed = Subfed.find(params[:id])
  end

  def create
    @subfed = current_user.subfeds.create(subfed_params)

    if @subfed.save!
      redirect_to subfed_url(@subfed)
    else
      Subfed.all
      render :index
    end
  end

  def update
    @subfed = current_user.subfeds.find(params[:id])
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
