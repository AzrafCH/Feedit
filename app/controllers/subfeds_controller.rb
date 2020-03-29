class SubfedsController < ApplicationController

  def index
    @subfeds = Subfed.all
  end

  def new
    @subfed = Subfed.new
  end

  def edit
    @subfed = current_user.subfeds.find(params[:id])
  end

  def show
    @subfed = Subfed.find_by_id(params[:id])
    @subfed.forums.build
    #@subfed.posts = Post.find(params[:id]).where(subfed_ids: Subfed.id)
  end

  def create
    @subfed = current_user.subfeds.build(subfed_params)

    if @subfed.save!
      redirect_to subfed_url(@subfed)
    else
      Subfed.all
      render :index
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

    def subfed_params
      params.require(:subfed).permit(:title, :content)
    end

end
