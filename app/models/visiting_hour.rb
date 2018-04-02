class VisitingHour < ApplicationRecord
  belongs_to :visiting_day
  has_many :appointments

  default_scope { order(time: :asc) }
end
