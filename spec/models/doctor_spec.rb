require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before do
    FactoryBot.create_list(:review, 10)
  end
  
  describe '#three_best_doctors' do
    it 'returns 3 doctors with highest rating' do
      expect(Doctor.three_best_doctors.length).to eq(3)
      expect(Doctor.three_best_doctors.first.average_rating).to be_between(4, 5)
    end
  end
end
