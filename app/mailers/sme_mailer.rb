class SmeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sme_mailer.welcome.subject
  #
  def sme_registration(sme)
    @sme = sme
    mail(to: @sme.email, subject: 'You BPAY Biller Code is pending')
  end
end
