class NotificationJob < ApplicationJob
  queue_as :default

  def perform(patient, appointment)
    NotificationMailer.notification_email_for_patient(patient, appointment).deliver_later
  end
end
