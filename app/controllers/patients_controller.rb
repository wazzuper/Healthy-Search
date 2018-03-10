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
      flash[:notice] = 'Updated'
    else
      flash[:alert] = 'Something went wrong'
    end

    # get back to the current page
    redirect_back(fallback_location: request.referer)
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:full_name, :phone_number, :email)
  end
end
