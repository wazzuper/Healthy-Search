class VisitingDay < ApplicationRecord
  belongs_to :doctor
  has_many :visiting_hours, dependent: :destroy
  has_many :appointments

  validates :date, uniqueness: true
  validates :date, presence: true

  default_scope { order(date: :asc) }
end
