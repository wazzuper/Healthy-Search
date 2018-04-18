class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :visiting_hour
  belongs_to :visiting_day
  has_one :review, dependent: :destroy

  validates :date, presence: true

  def self.order_by_date_for_patients(id)
    Appointment.where(patient_id: id).order(date: :desc)
  end

  def self.order_by_date_for_doctors(id)
    Appointment.where(doctor_id: id).order(date: :desc)
  end
end
