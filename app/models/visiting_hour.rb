class VisitingHour < ApplicationRecord
  belongs_to :visiting_day
  has_one :appointment, dependent: :destroy

  validates :time, presence: true
  validates :time, uniqueness: { scope: :visiting_day_id }

  default_scope { order(time: :asc) }
  scope :availabe_hours, -> { left_outer_joins(:appointment).where(appointments: { patient_id: nil }) }
end
