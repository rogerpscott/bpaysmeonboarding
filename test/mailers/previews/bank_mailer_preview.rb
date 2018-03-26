# Preview all emails at http://localhost:3000/rails/mailers/bank_mailer
class BankMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/bank_mailer/sme_registration
  def sme_registration
    BankMailer.sme_registration
  end

end
