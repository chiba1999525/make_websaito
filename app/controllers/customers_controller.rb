class CustomersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.order(created_at: :desc)
    @genres = Genre.all.order(created_at: :desc)
  end
end
