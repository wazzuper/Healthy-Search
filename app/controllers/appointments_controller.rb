class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @appointment.doctor_id = params[:doctor_id]
  end
end
