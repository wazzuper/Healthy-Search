class VisitingDay < ApplicationRecord
  belongs_to :doctor
  has_many :visiting_hours, dependent: :destroy
  has_many :appointments, dependent: :destroy

  validates :date, uniqueness: { scope: :doctor_id }
  validates :date, presence: true

  default_scope { order(date: :asc) }
end
