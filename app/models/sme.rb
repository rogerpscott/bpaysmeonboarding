class Sme < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
            presence: true,
            format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ ,
            message: 'Invalid e-mail! Please provide a valid e-mail address'}
  validates :phone, presence: true
  validates :bsb, presence: true
  validates :account_number, presence: true
  validates :abn, presence: true
  validates :registered_business_name, presence: true
  validates :bpay_biller_name, presence: true
  belongs_to :bank
  enum status: [:new_application, :pending, :approved, :rejected]
end
