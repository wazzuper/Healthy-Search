class Specialization < ApplicationRecord
  has_many :doctors

  validates :name, presence: true

  def self.search_by_request(filter)
    Specialization.all.where(name: filter)
  end

  def doctors_with_active_cards
    doctors.where(active: true)
  end
end
