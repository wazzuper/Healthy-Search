class VisitingDay < ApplicationRecord
  belongs_to :doctor
  has_many :visiting_hours, dependent: :destroy
  has_many :appointments, dependent: :destroy

  validates :date, uniqueness: { scope: :doctor_id }
  validates :date, presence: true

  default_scope { order(date: :asc) }

  def check_available_hours(day)
    available_hours = day.visiting_hours.count
    day.visiting_hours.each do |h|
      available_hours -= 1 if h.appointment
    end
    available_hours
  end
end
