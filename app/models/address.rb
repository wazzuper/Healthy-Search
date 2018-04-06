class Address < ApplicationRecord
  belongs_to :doctor

  validates :doctor_id, uniqueness: { scope: :doctor_id }
end
