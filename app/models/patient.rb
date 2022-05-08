class Patient < ApplicationRecord
  validates :firstName, :lastName, :email, presence: true

  has_many :appointments
  has_many :doctors, through: :appointments
end
