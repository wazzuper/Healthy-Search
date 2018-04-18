require 'rails_helper'

feature 'Patient makes an appointment' do
  let(:patient) { create(:patient) }
  let(:visiting_day_first) { create(:visiting_day) }
  let(:visiting_day_second) { create(:visiting_day) }
  let!(:address) { create(:address, doctor_id: visiting_day_first.doctor_id) }
  let!(:visiting_hours) { create_list(:visiting_hour, 5, visiting_day_id: visiting_day_first.id) }
  let!(:appointments) { create_list(:appointment, 3, visiting_day_id: visiting_day_second.id) }
  before { sign_in_patient(patient) }

  scenario 'allows a patient to make an appointment', js:true do
    visit "/appointments/new?doctor_id=#{visiting_day_first.doctor_id}&date=#{visiting_day_first.date}"

    visiting_hours.each do |hour|
      expect(page).to have_content(hour.time.strftime("%k:%M"))
    end

    click_button(visiting_hours.first.time.strftime("%k:%M"))
    click_button(I18n.t 'appointments.book')

    expect(page).to have_content(I18n.t 'appointments.details')
  end

  scenario 'outputs a message that doctors doesn\'t have available hours' do
    visit "/appointments/new?doctor_id=#{visiting_day_second.doctor_id}&date=#{visiting_day_second.date}"

    expect(page).to have_content(I18n.t 'appointments.no_hours', name: Doctor.find(visiting_day_second.doctor_id).full_name)
  end
end
