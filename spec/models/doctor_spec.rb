require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:doctor) { create(:doctor) }
  before { create_list(:review, 10) }

  describe '#three_best_doctors' do
    subject(:best_three_doctors) { Doctor.three_best_doctors }

    it 'returns 3 doctors with highest rating' do
      expect(best_three_doctors.length).to eq(3)
      expect(best_three_doctors.first.average_rating).to be_between(4, 5)
      expect(best_three_doctors.second.average_rating).to be_between(4, 5)
      expect(best_three_doctors.last.average_rating).to be_between(4, 5)
    end

    it { is_expected.to_not include(doctor) }
  end
end
