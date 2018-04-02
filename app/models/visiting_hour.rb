class VisitingHour < ApplicationRecord
  belongs_to :visiting_day
  has_one :appointment

  validates :time, presence: true
  validates :time, uniqueness: { scope: :visiting_day_id }

  default_scope { order(time: :asc) }
end
