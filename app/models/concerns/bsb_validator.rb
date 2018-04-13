class BsbValidator < ActiveModel::Validator
  def validate(sme)
    if (BSB.lookup sme.bsb) == nil || (BSB.lookup sme.bsb)[:mnemonic] != sme.bank.name
      sme.errors.add(:bsb, "Please enter a valid " + sme.bank.name + " BSB number")
    end
  end
end
