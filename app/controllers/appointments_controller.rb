class AppointmentsController < ApplicationController
  before_action :authenticate_patient!

  def new
    if params[:date].eql?('')
      redirect_back(fallback_location: request.referer, alert: 'You must specify a date.')
    else
      @appointment = Appointment.new(doctor_id: params[:doctor_id], date: params[:date])
      @doctor = Doctor.find(params[:doctor_id])
      @appointments_with_booked_hours = Appointment.find_booked_hours(@doctor, @appointment.date)
    end
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
