module SessionHelper
  def sign_in_patient(patient)
    visit(new_patient_session_path)
    fill_in(:patient_email, with: patient.email)
    fill_in(:patient_password, with: patient.password)
    click_button(I18n.t 'devise.sessions.log_in')
  end
end
