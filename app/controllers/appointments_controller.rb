class AppointmentsController < ApplicationController
  before_action :authenticate_patient!, only: [:new, :create]

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    if params[:date].eql?('')
      redirect_back(fallback_location: request.referer, alert: 'You must specify a date.')
    else
      @doctor = Doctor.find(params[:doctor_id])
      @visiting_day = @doctor.visiting_days.find_by_date(params[:date])

      unless @visiting_day.nil?
        @appointment = Appointment.new(
          date: params[:date],
          doctor_id: params[:doctor_id],
          visiting_day_id: @visiting_day.id
        )
      end
    end
  end

  def create
    appointment = Appointment.new(appointment_params)
    doctor = appointment.doctor

    if appointment.save
      NotificationMailer.notification_email_for_doctor(doctor, appointment).deliver_now
      flash[:notice] = 'Done! See you!'
      redirect_to appointment_path(appointment)
    else
      flash[:alert] = 'Something went wrong'
      redirect_back(fallback_location: request.referer)
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :doctor_id, :patient_id, :visiting_day_id, :visiting_hour_id, :note)
  end
end
