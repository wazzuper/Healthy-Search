class Patient < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  has_many :reviews, dependent: :destroy

  validates :full_name, :email, presence: true
end
