require 'rails_helper'

RSpec.describe NotificationMailer, type: :mailer do
  describe '#notification_email_for_doctor' do
    let(:appointment) { create(:appointment) }
    let(:mail) { NotificationMailer.notification_email_for_doctor(appointment.doctor, appointment) }

    it 'renders the headers' do
      expect(mail.from).to eq([I18n.t('mailer.default')])
      expect(mail.subject).to eq(I18n.t('mailer.make_appointment'))
      expect(mail.to).to eq([appointment.doctor.email])
    end

    it 'renders the doctor\'s name' do
      expect(mail.body.encoded).to match(appointment.doctor.full_name)
    end

    it 'renders the patient\'s name' do
      expect(mail.body.encoded).to match(appointment.patient.full_name)
    end

    it 'renders the appointment\'s url' do
      expect(mail.body.encoded).to match("http://localhost:3000/appointments/#{appointment.id}")
    end
  end
end
