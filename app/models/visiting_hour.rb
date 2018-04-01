class VisitingHour < ApplicationRecord
  belongs_to :doctor
  has_many :appointments, dependent: :destroy

  default_scope { order(time: :asc) }
end
