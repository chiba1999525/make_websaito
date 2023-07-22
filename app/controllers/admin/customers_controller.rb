class Admin::CustomersController < ApplicationController
  def index
    @user = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.order(created_at: :desc)
  end

  def mypage
    @user = User.find(params[:id])
    @blogs = @user.blogs.order(created_at: :desc)
  end

end
