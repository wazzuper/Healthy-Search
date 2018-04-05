class Review < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :appointment

  validates :rating, presence: true
  validates :comment, presence: true
  validates :appointment_id, uniqueness: { scope: :appointment_id }

  def find_patient_name(patient_id)
    Patient.find(patient_id).full_name
  end
end
