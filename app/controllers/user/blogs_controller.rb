class User::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: %i[ show edit update destroy ]
  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all.order(created_at: :desc)
    @genres = Genre.all.order(created_at: :desc)
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @blogs = Blog.find(params[:id])
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  def thank_you
  end

  def edit_thank_you
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
    if @blog.user != current_user
      redirect_to user_blogs_path
    end
  end

  # POST /blogs or /blogs.json
  def create
      @blog = Blog.new(blog_params)
      @blog.user_id = current_user.id
    if @blog.save
      flash[:notice] = '投稿完了いたしました'
      redirect_to thank_you_user_blogs_path
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :_form
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      flash[:notice] = '投稿変更しました！'
      redirect_to thank_you_edit_user_blogs_path
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :edit
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to user_blogs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content,:avatar, :user_id, :genre_id)
    end

end
