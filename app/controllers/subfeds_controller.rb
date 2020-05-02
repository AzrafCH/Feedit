class SubfedsController < ApplicationController
    before_action :require_logged_in
    before_action :current_user

  def index
    @subfeds = Subfed.all
    @recent_subfeds = Subfed.all.recent(10)
  end

  def new
    @subfed = current_user.subfeds.new
  end

  def edit
    @subfed = Subfed.find_by(id: params[:id])
  end

  def show
    @subfed =  Subfed.find_by(id: params[:id])
  end

  def create
    @subfed = Subfed.new(subfed_params)
    @subfed.user_id = current_user.id
    if @subfed.save
      redirect_to subfed_url(@subfed)
    else
      render 'new'
    end
  end

  def update
    @subfed = Subfed.find(params[:id])
    if @subfed.user_id == current_user.id
      @subfed.update(subfed_params)
      redirect_to subfed_url(@subfed)
    else
      redirect_to users_path
    end
  end

  def destroy
    @subfed = Subfed.find(params[:id])
    if @subfed.user_id == current_user.id
      Subfed.find(params[:id]).destroy
      redirect_to subfeds_path
    else
      redirect_to users_path
    end
  end

  private

    def subfed_params
      params.require(:subfed).permit(:title, :content, :user_id)
    end

end
