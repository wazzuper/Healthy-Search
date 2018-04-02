class VisitingDay < ApplicationRecord
  belongs_to :doctor
  has_many :visiting_hours, dependent: :destroy
  has_many :appointments
end
