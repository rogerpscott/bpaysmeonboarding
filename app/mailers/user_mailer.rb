class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sme_registration.subject
  #
  def sme_registration(sme)
    @sme = sme
    @bank = @sme.bank
    mail(to: User.all, subject: 'A new SME has registered to become a BPAY biller')
  end

end
