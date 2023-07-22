class GenresController < ApplicationController

  def show
    @genres = Genre.all.order(created_at: :desc)
    @genre = Genre.find(params[:id])
    @blogs = @genre.blogs.order(created_at: :desc)
  end
end
