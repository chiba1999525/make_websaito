class User::InquiriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inquiry, only: %i[ show edit update destroy ]

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
  end

  # POST /inquiries or /inquiries.json
  def create
      @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash[:notice] = '投稿変更しました！'
      redirect_to user_top_path
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :new
    end
  end

  def thank_you
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
