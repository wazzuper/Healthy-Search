class VisitingHour < ApplicationRecord
  belongs_to :doctor
  belongs_to :appointment, optional: true
end
