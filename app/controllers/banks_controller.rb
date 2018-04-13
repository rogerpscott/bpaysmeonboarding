class BanksController < ApplicationController
  def show
    @bank = Bank.friendly.find(params[:id])
    @sme = Sme.new
  end

  def lookup_abn
    client = ABNSearch.new("74742d83-d804-477b-b1cc-10ecc9c0f397")
    @company = client.search(params[:data_value])
    respond_to do |format|
      format.html
      format.json {render json: @company}
    end
  end

  def lookup_bsb
    if (BSB.lookup params[:data_bsb]) != nil
      @bank = Bank.friendly.find(params[:data_bank])
      (BSB.lookup params[:data_bsb])[:mnemonic] == @bank.name ? @result = true : @result = false
    else
      @result = false
    end
    respond_to do |format|
      format.html
      format.json {render json: @result}
    end
  end

end
