class PatientsController < ApplicationController
  before_action :set_patient
  before_action :authenticate_patient!

  def appointments
    @appointments = Appointment.where(patient_id: @patient).order(created_at: :desc)
  end

  def reviews
  end

  def update
    if @patient.update(patient_params)
      redirect_to edit_patient_registration_path
    else
      render 'registrations/edit'
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:full_name, :phone_number, :email)
  end
end
