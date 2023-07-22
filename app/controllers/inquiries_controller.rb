class InquiriesController < ApplicationController
  before_action :set_inquiry, only: %i[ show edit update destroy ]

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
  end

  # POST /inquiries or /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)
  if @inquiry.save
    flash[:notice] = '送信しました'
    redirect_to thank_you_inquiries_path
  else
    flash.now[:alert] = "メッセージを入力してください"
    render :new
  end

  def thank_you
  end
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
