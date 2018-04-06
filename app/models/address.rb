class Address < ApplicationRecord
  belongs_to :doctor

  geocoded_by :place
  after_validation :geocode, if: :place_changed?

  validates :doctor_id, uniqueness: { scope: :doctor_id }
end
