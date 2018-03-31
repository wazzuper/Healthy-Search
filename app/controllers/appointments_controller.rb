class AppointmentsController < ApplicationController
  before_action :authenticate_patient!
  
  def new
    @appointment = Appointment.new
    @appointment.doctor_id = params[:doctor_id]
    @appointment.date = params[:date]
    @doctor = Doctor.find(params[:doctor_id])
    @appointments_with_booked_hours = Appointment.find_booked_time(@doctor, @appointment.date)
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      flash[:notice] = 'Done! See you!'
    else
      flash[:alert] = 'Something went wrong'
    end

    redirect_back(fallback_location: request.referer)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :doctor_id, :patient_id, :visiting_hour_id)
  end
end
