class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :visiting_hour
  belongs_to :visiting_day

  def self.find_booked_hours(doctor, date)
    list_of_hours = []
    Appointment.joins(:patient, :doctor).where(date: date).each do |a|
      list_of_hours << a.visiting_hour_id
    end
    list_of_hours
  end
end
