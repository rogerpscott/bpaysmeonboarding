class Bank < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :days_to_confirm, presence: true
  has_many :smes
  has_many :users
end
