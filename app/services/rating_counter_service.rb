class RatingCounterService
  def get_three_best_doctors
    doctors = find_doctors_with_reviews
    sorted_doctors = sort_doctors(doctors)
    reversed_hash = reverse_hash_with_sorted_doctors(sorted_doctors)
    three_doctors = get_first_three_doctors(reversed_hash)
  end

  private

  def find_doctors_with_reviews
    doctors_with_reviews = {}

    Doctor.all.each do |doctor|
      if doctor.reviews.count > 0 && doctor.average_rating >= 4
        doctors_with_reviews[doctor] = doctor.average_rating
      end
    end

    doctors_with_reviews
  end

  def sort_doctors(doctors)
    doctors.sort_by { |doctor, rating| rating }
  end

  def reverse_hash_with_sorted_doctors(sorted_doctors)
    reversed = sorted_doctors.reverse_each.to_h
  end

  def get_first_three_doctors(reversed_hash)
    reversed_hash.first(3).to_h.keys
  end
end
