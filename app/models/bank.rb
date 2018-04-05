class Bank < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :days_to_confirm, presence: true
  has_many :smes
end
