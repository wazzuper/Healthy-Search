class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :visiting_hour
  belongs_to :visiting_day

  def self.find_booked_hours
    list_of_hours = []
    Appointment.joins(:patient, :doctor, :visiting_hour, :visiting_day).each do |a|
      list_of_hours << a.visiting_hour_id
    end
    list_of_hours
  end
end
