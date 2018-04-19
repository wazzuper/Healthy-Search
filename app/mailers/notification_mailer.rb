class NotificationMailer < ApplicationMailer
  def notification_email_for_doctor(doctor, appointment)
    @doctor = doctor
    @appointment = appointment
    mail(to: @doctor.email, subject: I18n.t('mailer.make_appointment'))
  end
end
