module SpecializationsHelper
  def get_specializations
    Specialization.all.map do |specialization|
      [specialization.name]
    end
  end
end
