class BanksController < ApplicationController
  def show
    @bank = Bank.friendly.find(params[:id])
    @sme = Sme.new
  end
end
