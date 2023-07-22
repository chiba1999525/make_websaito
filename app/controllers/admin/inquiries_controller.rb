class Admin::InquiriesController < ApplicationController

  #ログイン済みのアクセス
  before_action :authenticate_admin!

  before_action :set_inquiry, only: %i[ show edit update destroy ]


  def index
    @inquirys = Inquiry.all.order(created_at: :desc)
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
    redirect_to admin_inquiries_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inquiry_params
      params.require(:inquiry).permit(:name, :number, :content)
    end
end
