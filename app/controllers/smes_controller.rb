class SmesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :show, :lookup]
  def new
  end

  def create
    @bank = Bank.friendly.find(params[:bank_id])
    @sme = Sme.new(sme_params)
    @sme.bank = @bank
    if @sme.save
      client = ABNSearch.new("74742d83-d804-477b-b1cc-10ecc9c0f397")
      @sme.registered_business_name = client.search(@sme.abn)[:main_name]
      @sme.save
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
    redirect_to bank_sme_path(bank, sme), notice: "Thank you " + sme.first_name + ". The form was successfully submitted"
  end

end
