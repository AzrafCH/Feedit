class SubfedsController < ApplicationController

  def index
    @subfeds = Subfed.all
  end

  def new
    @subfed = Subfed.new
  end

  def edit
    @subfed = Subfed.find(params[:id])
  end

  def show
    @subfed = Subfed.find(params[:id])
  end

  def create
    @subfed = Subfed.new(subfed_params)
    if @subfed.save
      redirect_to subfed_url(@subfed)
    else
      @subfeds = Subfed.all
      render :index
    end
  end

  def update
    @subfed = Subfed.find(params[:id])
    @subfed.update(subfed_params)
    redirect_to subfeds_path(@subfed)
  end

  def destroy
    @subfed = Subfed.find(params[:id])
    @subfed.destroy
    redirect_to subfeds_url
  end

  private
    def subfed_params
      params.require(:subfed).permit(:title, :content)
    end

end
