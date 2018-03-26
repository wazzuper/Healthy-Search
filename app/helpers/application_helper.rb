module ApplicationHelper
  def doctor_avatar(doctor)
    if doctor.avatar.present?
      current_doctor.avatar
    else
      'default_avatar.svg'
    end
  end
end
