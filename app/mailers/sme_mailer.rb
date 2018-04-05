class SmeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sme_mailer.welcome.subject
  #
  def sme_registration_with_pdf(sme)
    @sme = sme
    @bank = @sme.bank
    attachments['filename_for_user.pdf'] = generate_pdf_content
    mail(to: @sme.email, subject: 'Your BPAY Biller Code is pending')
  end

  def sme_registration_without_pdf(sme)
    @sme = sme
    @bank = @sme.bank
    mail(to: @sme.email, subject: 'Your BPAY Biller Code is pending')
  end

private

  def generate_pdf_content
    pdf = WickedPdf.new.pdf_from_string('<h1>Hello There!</h1>')
  end

end
