class SubfedsController < ApplicationController
    before_action :require_logged_in
    before_action :current_user
    before_action :set_subfed, only: [:edit, :update, :destroy]

  def index
    @subfeds = Subfed.all
    @recent_subfeds = Subfed.all.recent(10)
  end

  def new
    @subfed = Subfed.new
    authorize @subfed
  end

  def edit
  end

  def show
    @subfed = Subfed.find(params[:id])
  end

  def create
    @subfed = current_user.subfeds.build(subfed_params)
    if @subfed.save
      authorize @subfed
      redirect_to subfed_url(@subfed)
    else
      render 'new'
    end
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
    def set_subfed
      @subfed = Subfed.find(params[:id])
      authorize @subfed
    end

    def subfed_params
      params.require(:subfed).permit(:title, :content, :user_id)
    end

end
