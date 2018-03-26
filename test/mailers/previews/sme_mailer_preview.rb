# Preview all emails at http://localhost:3000/rails/mailers/sme_mailer
class SmeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sme_mailer/welcome
  def sme_registration
    sme = Sme.first
    SmeMailer.sme_registration(sme)
  end

end
