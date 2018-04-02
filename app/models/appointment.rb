class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :visiting_hour

  def self.order_by_date_for_patients(id)
    Appointment.where(patient_id: id).order(date: :desc)
  end

  def self.order_by_date_for_doctors(id)
    Appointment.where(doctor_id: id).order(date: :desc)
  end

  def self.find_booked_hours(doctor, date)
    list_of_hours = []
    Appointment.joins(:patient, :doctor).where(date: date).each do |a|
      list_of_hours << a.visiting_hour_id
    end
    list_of_hours
  end
end
