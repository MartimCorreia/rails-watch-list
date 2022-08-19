class ListsController < ApplicationController
  def index
    @lists = List.all
    @messageH1 = "Save any kind of movies"
    @messageP = "Classic"
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: params[:id])
    @movies = Movie.all
    @messageH1 = "#{@list.name}"
  end

  def new
    @list = List.new
    @messageH1 = "Choose a List name!"
  end

  def create
    @list = List.new(list_params)
    @list.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
