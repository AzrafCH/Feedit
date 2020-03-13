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
    #@subfed = Subfed.new(subfed_params)
    #session[:subfed_id] = @subfed.id
  #  @subfed.save
    #redirect_to subfed_path(@subfed)

    @subfed = Subfed.create(subfed_params)
    #return redirect_to controller: 'subfeds', action: 'new' unless @subfed.save
    #redirect_to controller: 'subfeds', action: 'index'
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
    redirect_to subfed_path(@subfed)
  end

  def destroy
    @subfed = Subfed.find(params[:id])
    @subfed.destroy
    redirect_to subfeds_url
  end

  private
    def subfed_params
      params.require(:subfed).permit(:title, :content, :subfed_id)
    end

end
