class Sme < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email_format: { message: "Doesn't look like an email address" }
  validates :phone, presence: true, phone: true
  validates :bsb, presence: true
  validates :account_number, presence: true
  validates :abn, presence: true
  validates :registered_business_name, presence: true
  validates :bpay_biller_name, presence: true
  belongs_to :bank
  enum status: [:new_application, :pending, :approved, :rejected]
end
