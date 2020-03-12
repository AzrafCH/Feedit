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
    @subfed = Subfed.create(title: params[:title])
    session[:subfed_id] = @subfed.id
    @subfed.save
    redirect_to subfed_url(@subfed)

  #  return redirect_to controller: 'subfeds', action: 'new' unless @subfed.save
  #  session[:subfed_id] = @subfed.id
  #  redirect_to controller: 'subfeds', action: 'index'
    #if @subfed.save
    #  session[:subfed_id] = @subfed.id
    #  redirect_to subfed_url(@subfed)
  #  else
    #  @subfeds = Subfed.all
    #  render :index
  #  end
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
      params.require(:subfeds).permit(:title, :content, :subfed_id)
    end

end
