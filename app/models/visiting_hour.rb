class VisitingHour < ApplicationRecord
  belongs_to :doctor
  has_many :appointment

  default_scope { order(time: :asc) }
end
