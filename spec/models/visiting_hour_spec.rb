require 'rails_helper'

RSpec.describe VisitingHour, type: :model do
  describe '#availabe_hours' do
    let(:visiting_day_first) { create(:visiting_day) }
    let(:visiting_day_second) { create(:visiting_day) }
    before { create_list(:visiting_hour, 5, visiting_day_id: visiting_day_first.id) }
    before { create_list(:appointment, 3, visiting_day_id: visiting_day_second.id) }
    
    it 'returns available hours for booking' do   
      expect(visiting_day_first.visiting_hours.availabe_hours.count).to eq(5)
    end

    it 'not returns available hours for booking' do   
      expect(visiting_day_second.visiting_hours.availabe_hours.count).to eq(0)
    end
  end
end
