require 'rails_helper'

RSpec.describe NotificationJob, type: :job do
  describe '#perform' do
    after do
      Sidekiq::RetrySet.new.clear
      Sidekiq::ScheduledSet.new.clear
    end
    
    let(:patient) { create(:patient) }
    let(:appointment) { create(:appointment, patient_id: patient.id) }

    it 'job is created' do
      ActiveJob::Base.queue_adapter = :test
      expect{
        NotificationMailer.notification_email_for_patient(patient, appointment).deliver_later
      }.to have_enqueued_job.on_queue('mailers')
    end
  end
end
