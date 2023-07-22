class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all.order(created_at: :desc)
    @genres = Genre.all.order(created_at: :desc)
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @blogs = Blog.find(params[:id])
    impressionist(@blog, nil, :unique => [:ip_address])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content,:avatar)
    end

end
