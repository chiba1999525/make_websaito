class User::CustomersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.order(created_at: :desc)
  end

  def mypage
    @user = User.find(params[:id])
    @blogs = @user.blogs.order(created_at: :desc)
  end

end
