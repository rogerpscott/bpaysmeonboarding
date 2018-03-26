class BankMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bank_mailer.sme_registration.subject
  #
  def sme_registration(sme)
    @sme = sme
    @bank = @sme.bank
    mail(to: @bank.email, subject: 'A new Client has registered to become a BPAY biller')
  end
end
