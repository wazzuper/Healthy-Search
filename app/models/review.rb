class Review < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :appointment

  validates :rating, presence: true
  validates :comment, presence: true
  validates :appointment_id, uniqueness: { scope: :appointment_id }
end
