class NotificationMailer < ApplicationMailer
  def notification_email_for_doctor(doctor, appointment)
    @doctor = doctor
    @appointment = appointment
    mail(to: @doctor.email, subject: I18n.t('mailer.make_appointment'))
  end

  def notification_email_for_patient(patient, appointment)
    @patient = patient
    @appointment = appointment
    mail(to: @patient.email, subject: 'Tommorow you have a meeting with a doctor!')
  end
end
