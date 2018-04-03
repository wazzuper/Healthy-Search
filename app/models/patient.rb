class Patient < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments
  has_many :doctors, through: :appointments
  has_many :reviews

  validates :full_name, :email, presence: true
end
