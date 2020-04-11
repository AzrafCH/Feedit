class SubfedsController < ApplicationController

    before_action :require_logged_in

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
    @subfed = Subfed.find_by_id(params[:id])
  end

  def create
    @subfed = Subfed.new(subfed_params)
    @subfed.save

    redirect_to subfed_url(@subfed)
  end

  def update
    @subfed = Subfed.find_by_id(params[:id])
    @subfed.update(subfed_params)
    redirect_to subfed_url(@subfed)
  end

  def destroy
    @subfed = Subfed.find(params[:id]).destroy
    redirect_to subfeds_path
  end

  private

    def subfed_params
      params.require(:subfed).permit(:title, :content)
    end

end
