class SmesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  def new
  end

  def create
    @bank = Bank.find(params[:bank_id])
    @sme = Sme.new(sme_params)
    @sme.bank = @bank
    if @sme.save
      redirect_to root_path
    else
      redirect_to bank_path(@bank), alert: "Unexpected error your booking was not saved"
    end
  end

  private

  def sme_params
    params.require(:sme).permit(:first_name, :last_name, :email, :phone, :registered_business_name, :bpay_biller_name, :abn, :bsb, :account_number, :bank_id)
  end

end
