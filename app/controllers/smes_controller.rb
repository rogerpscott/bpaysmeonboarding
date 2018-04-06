class SmesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :show]
  def new
  end

  def create
    @bank = Bank.friendly.find(params[:bank_id])
    @sme = Sme.new(sme_params)
    @sme.bank = @bank
    if @sme.save
      confirm(@bank, @sme)
    else
      render 'banks/show'
    end
  end

  def show
    @bank = Bank.friendly.find(params[:bank_id])
    @sme = Sme.find(params[:id])
  end

  private

  def sme_params
    params.require(:sme).permit(:first_name, :last_name, :email, :phone, :registered_business_name, :bpay_biller_name, :abn, :bsb, :account_number, :bank_id)
  end

  def confirm (bank, sme)
    bank.require_pdf ? SmeMailer.sme_registration_with_pdf(sme).deliver_now : SmeMailer.sme_registration_without_pdf(sme).deliver_now
    UserMailer.sme_registration(sme).deliver_now
    redirect_to bank_sme_path(bank, sme), notice: "thanks " + sme.first_name + " it works"
  end

end
