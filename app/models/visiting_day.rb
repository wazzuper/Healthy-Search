class VisitingDay < ApplicationRecord
  belongs_to :doctor
  has_many :visiting_hours
  has_many :appointments
end
