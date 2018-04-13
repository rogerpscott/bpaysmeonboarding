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
    string = '<h1>BPAY biller Consent Form</h1>
<p>I confirm that the following details are correct and that I am the owner or representative of the following business</p>
<br>
  <p>First name: ' + @sme.first_name + '</p>
  <p>Last Name: ' + @sme.last_name + '</p>
  <p>Email: ' + @sme.email + '</p>
  <p>Phone number: ' + @sme.phone + '</p>
  <p>ABN: ' + @sme.abn + '</p>
  <p>Business name: ' + @sme.registered_business_name + '</p>
  <p>BSB: ' + @sme.bsb + '</p>
  <p>Account number: ' + @sme.account_number + '</p>
</p>

<br>

<p> ' + @sme.first_name + ' ' + @sme.last_name + '</p>
<p>Date:</p>'
    pdf = WickedPdf.new.pdf_from_string(string)
  end

end
