class VisitingHour < ApplicationRecord
  belongs_to :visiting_day
  has_many :appointments

  validates :time, presence: true

  default_scope { order(time: :asc) }
end
