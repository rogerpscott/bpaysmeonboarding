class BanksController < ApplicationController
  def show
    @bank = Bank.find(params[:id])
    @sme = Sme.new
  end

  private
end
