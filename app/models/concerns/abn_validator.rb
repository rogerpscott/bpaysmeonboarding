class AbnValidator < ActiveModel::Validator
  def validate(sme)
    client = ABNSearch.new("74742d83-d804-477b-b1cc-10ecc9c0f397")
    if client.search(sme.abn)[:abn] == nil
      sme.errors.add(:abn, "Please enter a valid ABN")
    end
  end
end
