class Sme < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Please enter a valid email" }
  validates :phone, presence: true, phone: {message: "Please enter a valid phone number"}, format: { with: /\d{10}/, message: "Please enter a valid phone number" }
  validates :bsb, presence: true, bsb_number: {message: "Please enter a valid BSB number"}, format: { with: /[a-zA-Z0-9]{5,6}/, message: "Please enter a valid BSB" }
  validates :account_number, presence: true, format: { with: /\d{9}/, message: "Please enter a valid Account Number" }
  validates :abn, presence: true, format: { with: /\d{11}/, message: "Please enter a valid ABN" }
  validates :registered_business_name, presence: true
  validates :bpay_biller_name, presence: true, format: { with: /^[A-z\s]+$/, multiline: true, message: "Please use only letters and spaces" }
  belongs_to :bank
  enum status: [:new_application, :pending, :approved, :rejected]
end
