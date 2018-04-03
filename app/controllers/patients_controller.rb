class PatientsController < ApplicationController
  before_action :set_patient
  before_action :authenticate_patient!
  before_action :is_authorised?

  def appointments
    @appointments = Appointment.order_by_date_for_patients(@patient).paginate(page: params[:page], per_page: 10)
  end

  def reviews
  end

  def update
    if @patient.update(patient_params)
      flash[:notice] = 'Updated'
    else
      flash[:alert] = 'Something went wrong'
    end
    redirect_back(fallback_location: request.referer)
  end

  private

  def is_authorised?
    redirect_to root_path, alert: 'You do not have permission for this.' unless current_patient.id == @patient.id
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:full_name, :phone_number, :email)
  end
end
