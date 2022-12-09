class BookmarksController < ApplicationController

  def new
  @bookmark = Bookmark.new
  end

  def create
  @list = List.find(params[:list_id])
  @movie = Movie.where(id: params[:bookmark][:movie])
  @bookmark = Bookmark.new(list: @list, movie: @movie)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  @bookmark = Bookmark.find(params[:id])
  end
end
