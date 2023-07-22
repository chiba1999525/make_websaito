class Admin::GenresController < ApplicationController

  #ログイン済みのアクセス
  before_action :authenticate_admin!
  def index
    @genres = Genre.all.order(created_at: :desc)
    @genre = Genre.new
  end

  def show
    @genres = Genre.all.order(created_at: :desc)
    @genre = Genre.find(params[:id])
    @blogs = @genre.blogs.order(created_at: :desc)
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
  genre = Genre.find(params[:id])
  genre.update(genre_params)
  redirect_to admin_genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
