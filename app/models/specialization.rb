class Specialization < ApplicationRecord
  has_many :doctors

  def self.list_of_specializations
    list = []

    Specialization.all.each do |spec|
      list << spec.name
    end

    list
  end
end
