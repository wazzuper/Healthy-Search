class Specialization < ApplicationRecord
  has_many :doctors

  validates :name, presence: true

  def self.list_of_specializations
    list = []
    Specialization.all.each do |spec|
      list << spec.name
    end
    list
  end

  def doctors_with_active_cards
    doctors.where(active: true)
  end
end
