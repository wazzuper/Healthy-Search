class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :visiting_hour
  belongs_to :visiting_day
end
